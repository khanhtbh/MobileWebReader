//
//  ReaderWebViewController.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation

import WebKit

class ReaderWebViewController: NSObject, WKNavigationDelegate {
    let webView : WKWebView = WKWebView(frame: .zero)
    
    var articleContent: String = "" {
        didSet {
            load()
        }
    }
    
    private var didUpdateContent = false
    
    override init() {
        super.init()
        webView.navigationDelegate = self
    }
    
    private func load() {
        guard let htmlPath = Bundle.main.path(forResource: "reader", ofType: "html")
        else { return }
        do {
            let contents = try NSString(contentsOfFile: htmlPath, encoding: String.Encoding.utf8.rawValue)
            let html = NSString(format: contents as NSString, self.articleContent)
            let url = URL(fileURLWithPath: htmlPath)
            webView.loadHTMLString(html as String, baseURL: url)
        } catch {
            
        }
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }

    deinit {
        print("Reader Web View Controller deinit")
    }
}
