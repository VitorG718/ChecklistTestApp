//
//  SortBy.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

struct SortBy: FilterOptionProtocol {
    let id: String
    let label: String
    
    static let first: String = "relevancy"
    static var all: [SortBy] = [
        SortBy(id: "relevancy", label: "Relevância"),
        SortBy(id: "popularity", label: "Popularidade"),
        SortBy(id: "publishedAt", label: "Recentes"),
    ]
}
