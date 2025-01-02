//
//  ContentView.swift
//  SecAware
//
//  Created by Panayot Panayotovå.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("System", systemImage: "list.clipboard") {
                SystemChecksView()
            }
            Tab("Tutorials", systemImage: "books.vertical.fill") {
                TutorialsView()
            }
            Tab("Vulnerabilities", systemImage: "ant.fill") {
                VulnerabilitiesView(viewModel: VulneravilitiesViewModel())
            }
        }
    }
}

#Preview {
    ContentView()
}
