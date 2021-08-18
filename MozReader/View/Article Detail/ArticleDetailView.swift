//
//  ArticleDetailView.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    
    private var webViewController = WebViewController()
    
    let article: Article
    
    init(article: Article) {
        self.article = article
        self.webViewController.urlString = article.url
    }
    
    var body: some View {
        PresentableWebView(webView: webViewController.webView)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}
