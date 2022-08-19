//
//  Category.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

struct Category: FilterOptionProtocol {
    let id: String
    let label: String
    
    static let first: String = ""
    static var all: [Category] = [
        Category(id: "", label: "Todas"),
        Category(id: "business", label: "Negócio"),
        Category(id: "entertainment", label: "Entreterimento"),
        Category(id: "general", label: "Geral"),
        Category(id: "health", label: "Saúde"),
        Category(id: "science", label: "Ciência"),
        Category(id: "sports", label: "Esportes"),
        Category(id: "technology", label: "Tecnologia"),
    ]
}
