//
//  OsSystemCheck.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import Foundation
import UIKit

class OsSystemCheck: SystemCheckProtocol {
    
    var title: String {
        "\(UIDevice.current.systemName) updates check"
    }
    
    var isSuccess: Bool = false
    
    var errorMessage: String = "Please update your OS to the latest available version"
    
    var successMessage: String {
        "You are using the lasted version of \(UIDevice.current.systemName)."
    }
    
    func run() async {
        let result = await AppleApi.fetchAvailableOsVersion(for: platform()).result
        switch result {
        case .success(let version):
            DispatchQueue.main.sync { [weak self] in
                self?.isSuccess = version != nil && version == UIDevice.current.systemVersion
            }
        default: break
        }
    }
    
    private func platform() -> String {
        #if targetEnvironment(simulator)
        return ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iPhone16,2"
        #else
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0,  count: size)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
        #endif
    }
}
