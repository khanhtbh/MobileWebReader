//
//  Article.swift
//  MozReader
//
//  Created by Khanh Trinh on 18/08/2021.
//

import Foundation


struct Article : Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var thumb: String
}
