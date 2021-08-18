//
//  ArticleDetailView.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    
    @ObservedObject private var webViewController = MainWebViewController()
    private var readerViewController = ReaderWebViewController()
    @State private var readerMode = false
    
    init(article: Article) {
        self.article = article
        self.webViewController.urlString = article.url
    }
    
    var body: some View {
        if !readerMode {
            PresentableWebView(webView: webViewController.webView)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: { [weak readerViewController] in
                            if readerViewController?.articleContent.count == 0 {
                                readerViewController?.articleContent = webViewController.articleContentHtml
                            }
                            readerMode = true
                        }, label: {
                            Text("Reader").font(.subheadline)
                        }).disabled(webViewController.articleContentHtml.count == 0)
                    }
                })
        } else {
            PresentableWebView(webView: readerViewController.webView)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            readerMode = false
                        }, label: {
                            Text("Return").font(.subheadline)
                        })
                    }
                })
        }
    }
    
    private func updateReader() {
        
    }
}
