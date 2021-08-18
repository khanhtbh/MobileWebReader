//
//  WebViewController.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import WebKit

class MainWebViewController: NSObject, WKNavigationDelegate, ObservableObject {
    
    let webView : WKWebView = WKWebView(frame: .zero)
    
    var urlString: String = "" {
        didSet {
            load()
        }
    }
    
    @Published var articleContentHtml = ""
    
    override init() {
        super.init()
        webView.navigationDelegate = self
    }
    
    private func load() {
        guard let url = URL(string: urlString)
        else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard articleContentHtml.count == 0 else { return }
        let script = """
            document.querySelector('article').outerHTML
        """
        webView.evaluateJavaScript(script) { result, error in
            guard let result = result as? String, result.count > 0 else { return }
            self.articleContentHtml = result
        }
    }
}
