//
//  WebView.swift
//  SecAware
//
//  Created by Panayot Panayotov.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        let wKWebView = WKWebView()
        return wKWebView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }

}
