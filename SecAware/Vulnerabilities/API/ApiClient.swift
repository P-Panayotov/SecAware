//
//  ApiClient.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct CveItem: Identifiable {
    let id: String
    let published: String
    let lastModified: String
    let description: String
    let url: String
}

struct ApiClientResponse  {
    let pageSize: Int
    let startIndex: Int
    let totalRecords: Int
    let items: [CveItem]
}

protocol ApiClientProtocol {
    func fetchCVEs(itemsPerPage: Int, startIndex: Int, search: String) async throws -> ApiClientResponse
}

struct NistApiClient: ApiClientProtocol {
    func fetchCVEs(itemsPerPage: Int, startIndex: Int, search: String) async throws -> ApiClientResponse {
        let response: NistCveApiResponse = try await NistCveEndpoint(startIndex: startIndex, pageSize: itemsPerPage, search: search).asyncSend()
        return .init(
            pageSize: response.resultsPerPage,
            startIndex: startIndex,
            totalRecords: response.totalResults,
            items: response.vulnerabilities.map{ item in
                CveItem(
                    id: item.cve.id,
                    published: item.cve.published,
                    lastModified: item.cve.lastModified,
                    description: item.cve.getDescription().value,
                    url: item.cve.references.first?.url ?? ""
                )
            }
        )
    }
}
