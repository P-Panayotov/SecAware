//
//  CveListItemView.swift
//  SecAware
//
//  Created by Panayot Panayotov on 21/12/2024.
//

import SwiftUI

struct CveListItemView: View {
    
    let text: String
    let url: String
    let published: String
    let lastModified: String
    
    @State private var isTruncated = true
    @State private var shouldTruncate = false
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack(alignment: .trailing) {
            VStack(alignment: .leading, spacing: 8) {
                Text(text)
                    .font(.subheadline)
                    .truncated(lineLimit: 2, isTruncated: $isTruncated, shouldTruncate: $shouldTruncate)
                    .onTapGesture {
                        if shouldTruncate {
                            isTruncated.toggle()
                        }
                    }
                    .padding(.bottom, 8)
                HStack(alignment: .center) {
                    Text("Modified:")
                    Text(formattedDate(from: lastModified))
                }
                .font(.caption)
                .fontWeight(.bold)
            }
            .foregroundStyle(.white)
            .padding()
            .background(.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(formattedDate(from: published))
                .font(.caption)
                .fontWeight(.bold)
                .padding([.trailing, .bottom])
                .foregroundStyle(.white)
        }
    }
    
    func formattedDate(from iso8601String: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        guard let date = formatter.date(from: iso8601String) else {
            return iso8601String
        }
        
        return date.formatted(date: .abbreviated, time: .shortened)
    }
}

struct TruncatedTextViewModifier: ViewModifier {

    let lineLimit: Int
    @Binding var isTruncated: Bool
    @Binding var shouldTruncate: Bool
    @State private var intrinsicSize: CGSize = .zero
    @State private var truncatedSize: CGSize = .zero

    func body(content: Content) -> some View {
        content
            .truncationMode(.tail)
            .lineLimit(isTruncated ? lineLimit : nil)
            .background(
                ZStack {
                    content
                        .fixedSize(horizontal: false, vertical: true)
                        .hidden()
                        .readSize { size in
                            intrinsicSize = size
                            shouldTruncate = intrinsicSize != truncatedSize
                        }
                    content
                        .truncationMode(.tail)
                        .lineLimit(lineLimit)
                        .hidden()
                        .readSize { size in
                            truncatedSize = size
                            shouldTruncate = intrinsicSize != truncatedSize
                        }
                }
            )
    }
}

extension Text {
    func truncated(lineLimit: Int, isTruncated: Binding<Bool>, shouldTruncate: Binding<Bool>) -> some View {
        modifier(TruncatedTextViewModifier(
            lineLimit: lineLimit,
            isTruncated: isTruncated,
            shouldTruncate: shouldTruncate
        ))
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: { size in
            DispatchQueue.main.async {
                onChange(size)
            }
        })
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

#Preview {
    CveListItemView(
        text: "alskjd lkasjdlkasjkldjasjdl jaslkd jakls jdlkajs lk djlkasj dlkajs dlk;a;shfgo ;uarhfl jksdfl;kajslkd;fjl;kasdj flk sajdlk;fj sdal;k jfl;ksadjlkf; jsadlkjf l kasdjflkjasdkjfjsdlk",
        url: "https://google.com",
        published: "2024-08-28T23:55:05.513",
        lastModified: "2024-11-21T02:07:54.767"
    )
}
