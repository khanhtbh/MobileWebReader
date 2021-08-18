//
//  WebViewController.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import WebKit

struct WebViewController {
    
    let webView : WKWebView = WKWebView(frame: .zero)
    
    var urlString: String = "" {
        didSet {
            load()
        }
    }
    
    private func load() {
        guard let url = URL(string: urlString)
        else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
