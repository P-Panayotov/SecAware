//
//  VulneravilitiesViewModel.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

final class VulneravilitiesViewModel {
    
    private let apiClient: ApiClientProtocol
    
    required init(apiClient: ApiClientProtocol = NistApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchCVEs(itemsPerPage: Int, startIndex: Int, search: String) async throws -> ApiClientResponse {
        return try await self.apiClient.fetchCVEs(itemsPerPage: itemsPerPage, startIndex: startIndex, search: search)
    }
}
