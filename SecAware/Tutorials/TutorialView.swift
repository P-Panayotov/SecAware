//
//  TutorialView.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct TutorialView: View {
    
    let model: any Tutorial
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                model.image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.accent, lineWidth: 1)
                    }
                ForEach(model.sections) { item in
                    Text(.init(item.title))
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(item.content, id: \.self) { content in
                            Text(.init(content))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 8)
                        }
                    }
                }
                .padding(.top)
            }
            .padding(.horizontal)
        }
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar, .tabBar)
        .toolbarBackground(.white, for: .navigationBar, .tabBar)
    }
}

#Preview {
    TutorialView(model: WifiTutorial())
}
