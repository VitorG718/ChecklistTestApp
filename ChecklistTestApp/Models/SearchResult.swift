//
//  SearchResult.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 18/08/22.
//

import Foundation

struct SearchResult: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
