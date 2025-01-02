//
//  NistCveEndpoint.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftAPIClient

struct NistCveEndpoint: Endpoint {
    
    let startIndex: Int
    let pageSize: Int
    let search: String
    
    var path: String = "/rest/json/cves/2.0"
    var baseUrlString: String = "https://services.nvd.nist.gov"
    var query: [String : (any CustomStringConvertible)?]? {
        [
            "resultsPerPage": pageSize,
            "startIndex": startIndex,
            "keywordSearch": search,
            "keywordExactMatch": ""
        ]
    }
}

struct NistCveApiResponse: JsonResponse {
    let resultsPerPage: Int
    let startIndex: Int
    let totalResults: Int
    let vulnerabilities: [NistVulnerability]
}

struct NistVulnerability: JsonResponse {
    let cve: NistCve
}

struct NistCve: JsonResponse {
    let id: String
    let sourceIdentifier: String?
    let published: String
    let lastModified: String
    let references: [NistCveReference]
    let descriptions: [NistCveDescription]
    
    func getDescription() -> NistCveDescription {
        if let en = descriptions.first(where: { $0.lang.lowercased() == "en" }) {
            return en
        } else if let fallback = descriptions.first {
            return fallback
        }
        return NistCveDescription(lang: "def", value: "Description not available")
    }
}

struct NistCveReference: JsonResponse {
    let url: String
    let source: String
}

struct NistCveDescription: JsonResponse {
    let lang: String
    let value: String
}
