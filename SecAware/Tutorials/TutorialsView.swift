//
//  TutorialsView.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct TutorialsView: View {
    
    let viewModel = TutorialsViewModel()
    @State var selectedTutorial: (any Tutorial)?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.list, id: \.title) { item in
                    NavigationLink {
                        TutorialView(model: item)
                    } label: {
                        HStack(alignment: .center) {
                            item.image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .clipShape(Circle())
                            Text(.init(item.title)).font(.headline)
                        }
                    }
                }
            }
            .background(Gradient(colors: [.secondary, .primary]))
            .scrollContentBackground(.hidden)
            .navigationTitle("Tutorials")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar, .tabBar)
        }
    }
}

#Preview {
    TutorialsView()
}
