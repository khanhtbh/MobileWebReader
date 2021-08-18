//
//  PresentableWebView.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import SwiftUI
import WebKit

struct PresentableWebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView

    let webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
