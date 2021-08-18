//
//  ArticleList.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import SwiftUI
import Combine

class ArticleListPresentor: ObservableObject {
    
    @Published private(set) var articleViewModels = [ArticleRowViewModel]()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            DispatchQueue.main.async {
                self?.articleViewModels = ArticleInteractor().articles.map { ArticleRowViewModel(article: $0) }
            }
            
        }
    }
}

struct ArticleList: View {
    
    @StateObject private var presentor = ArticleListPresentor()
    
    var body: some View {
        NavigationView {
            List(presentor.articleViewModels, id: \.id) { viewModel in
                NavigationLink(destination: ArticleDetailView(article: viewModel.article)) {
                    ArticleRow(viewModel: viewModel)
                }
            }.navigationTitle("News")
        }
    }
}

struct ActicleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList()
    }
}

