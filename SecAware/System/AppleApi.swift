//
//  AppleApi.swift
//  SecAware
//
//  Created by Panayot Panayotov on 22/12/2024.
//

import Foundation

struct AppleApi {
    private static let plistURL = "https://s.mzstatic.com/version"
    
    static func fetchAvailableOsVersion(for device: String) -> Task<String?, Never> {
        Task<String?, Never> {
            if let url = URL(string: plistURL) {
                do {
                    let data = try Data(contentsOf: url)
                    if let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? Dictionary<String, Any> {
                        if let versions = plist["MobileDeviceSoftwareVersionsByVersion"] as? Dictionary<String, Any> {
                            for (_, value) in versions {
                                if let entry = value as? Dictionary<String, Any>, entry["MobileDeviceSoftwareVersions"] != nil {
                                    if let versions = entry["MobileDeviceSoftwareVersions"] as? Dictionary<String, Any> {
                                        if let currentDeviceData = versions[device] as? Dictionary<String, Any> {
                                            for (_, value) in currentDeviceData {
                                                if let batch = value as? Dictionary<String, Any>, let d = batch["Restore"] as? Dictionary<String, Any> {
                                                    if let version = d["ProductVersion"] as? String {
                                                        return version
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return nil
                } catch {
                    return nil
                }
            } else {
                return nil
            }
        }
    }
}
