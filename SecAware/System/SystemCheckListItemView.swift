//
//  SystemCheckListItemView.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import SwiftUI

struct SystemCheckListItemView: View {
    
    @State var viewModel: any SystemCheckProtocol
    
    @State private var hasFinished = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                if !hasFinished {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    Image(systemName: viewModel.isSuccess ? "checkmark.circle.fill" : "x.circle.fill")
                        .imageScale(.medium)
                        .foregroundStyle(viewModel.isSuccess ? .green : .red)
                }
                Text(viewModel.title)
                    .font(.title2)
            }
            if hasFinished {
                Text(viewModel.isSuccess ? viewModel.successMessage : viewModel.errorMessage)
                    .font(.footnote)
            }
        }
        .onAppear {
            Task {
                await viewModel.run()
                hasFinished = true
            }
        }
    }
}

#Preview {
    SystemCheckListItemView(viewModel: AppVersionCheck())
}
