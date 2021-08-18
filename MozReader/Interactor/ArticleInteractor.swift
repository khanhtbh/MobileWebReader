//
//  ArticleInteractor.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation

struct ArticleInteractor: JsonLoader {
    var articles: [Article] = []
    
    init() {
        articles = load("data.json")
    }
}
