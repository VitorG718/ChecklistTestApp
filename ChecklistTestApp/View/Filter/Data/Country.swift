//
//  Country.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

struct Country: FilterOptionProtocol {
    let id: String
    let label: String
    
    static let first: String = ""
    static var all: [Country] = [
        Country(id: "", label: "Todos"),
        Country(id: "br", label: "Brasil"),
        Country(id: "de", label: "Alemanha"),
        Country(id: "fr", label: "França"),
        Country(id: "ch", label: "China"),
        Country(id: "it", label: "Itália"),
        Country(id: "us", label: "Estados Unidos"),
        Country(id: "jp", label: "Japão"),
    ]
}
