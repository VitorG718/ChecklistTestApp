//
//  Article.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 18/08/22.
//

import Foundation

class Article: Decodable, Identifiable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
