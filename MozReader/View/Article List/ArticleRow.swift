//
//  ArticleRow.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation
import SwiftUI
import Combine

class ArticleRowViewModel: ObservableObject, Identifiable {

    @Published private(set) var image: UIImage?
    
    @Published private(set) var title: String
    
    var id: Int {
        return article.id
    }
    
    private(set) var article: Article
    
    init(article: Article) {
        self.article = article
        title = article.title
        loadImage()
    }
    
    private func loadImage() {
        guard let url = URL(string: article.thumb)
        else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self,
                  let data = data
            else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

struct ArticleRow: View {
    
    @ObservedObject var viewModel : ArticleRowViewModel
    
    init(viewModel: ArticleRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.image != nil ? viewModel.image! : UIImage())
                .resizable()
                .frame(width: 100, height: 80)
            Text(viewModel.title).font(.headline)

            Spacer()
        }
    }
}

struct ArticleItem_Previews: PreviewProvider {
    static let acticles = {
        return ArticleInteractor().articles
    }()
    static var previews: some View {
        ArticleRow(viewModel: ArticleRowViewModel(article: acticles[0]))
    }
}
