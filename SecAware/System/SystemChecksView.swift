//
//  SystemChecksView.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct SystemChecksView: View {
    
    var videModel = SystemChecksViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(videModel.checks, id:\.title) { check in
                    SystemCheckListItemView(viewModel: check)
                }
            }
            .background(Gradient(colors: [.secondary, .primary])    )
            .scrollContentBackground(.hidden)
            .navigationTitle("System checks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar, .tabBar)
            .toolbarBackground(.white, for: .navigationBar, .tabBar)
        }
    }
}

#Preview {
    SystemChecksView()
}
