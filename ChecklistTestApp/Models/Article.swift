//
//  Article.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 18/08/22.
//

import Foundation

struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}
