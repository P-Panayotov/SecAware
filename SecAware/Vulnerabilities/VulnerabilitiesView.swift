//
//  VulnerabilitiesView.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI
import SwiftAPIClient

struct VulnerabilitiesView: View {
    
    @State var viewModel: VulneravilitiesViewModel
    
    @State private var lastResponse: ApiClientResponse?
    @State private var list: [CveItem] = []
    @State private var isLoading = false
    @State private var urlToOpen: URL?
    @State private var errorMessage: String?
    
    var iOSVersion: String {
        let osVersion = ProcessInfo.processInfo.operatingSystemVersion
        var result = osVersion.majorVersion.description
        if osVersion.minorVersion > 0 {
            result += ".\(osVersion.minorVersion)"
        }
        return "iOS \(result)"
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if let errorMessage {
                        Text(errorMessage).foregroundStyle(.white).font(.title)
                            .padding(.vertical)
                    }
                    ForEach(list) { item in
                        CveListItemView(
                            text: item.description,
                            url: item.url,
                            published: item.published,
                            lastModified: item.lastModified
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            print(item.url)
                            urlToOpen = URL(string: item.url)
                        }
                    }
                    if isLoading {
                        HStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(.circular)
                            Spacer()
                        }
                    }
                    if !isLoading, let response = lastResponse, response.totalRecords > list.count {
                        Text("")
                            .onAppear { loadCves() }
                    }
                    if !isLoading, let lastResponse, lastResponse.items.isEmpty {
                        Text("No reported vulnerabilities found for \(iOSVersion)")
                            .padding(.top, 100)
                    }
                }
                .padding(.horizontal)
            }
            .background(Gradient(colors: [.secondary, .primary]))
            .scrollContentBackground(.hidden)
            .navigationDestination(item: $urlToOpen) { url in
                WebView(url: url)
            }
            .navigationTitle("Vulnerabilities for \(iOSVersion)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar, .tabBar)
            .toolbarBackground(.white, for: .navigationBar, .tabBar)
        }
        .refreshable {
            loadCves(force: true)
        }
        .onAppear {
            loadCves()
        }
        .animation(.default, value: list.count)
        .scrollIndicators(.hidden)
    }
    
    func loadCves(force: Bool = false) {
        Task {
            let oldResponse = lastResponse
            let oldList = list
            errorMessage = nil
            if force {
                lastResponse = nil
                list = []
            }
            do {
                isLoading = true
                lastResponse = try await viewModel.fetchCVEs(itemsPerPage: 20, startIndex: list.count, search: iOSVersion)
                list.append(contentsOf: lastResponse?.items ?? [])
                isLoading = false
            } catch {
                isLoading = false
                if force {
                    lastResponse = oldResponse
                    list = oldList
                }
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    VulnerabilitiesView(viewModel: VulneravilitiesViewModel())
}
