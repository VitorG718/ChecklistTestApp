//
//  ResultsPerPage.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

struct ResultsPerPage: FilterOptionProtocol {
    let id: String
    let label: String
    
    static let first: String = "10"
    static var all: [ResultsPerPage] = [
        ResultsPerPage(id: "10", label: "10"),
        ResultsPerPage(id: "20", label: "20"),
        ResultsPerPage(id: "30", label: "30"),
        ResultsPerPage(id: "40", label: "40"),
        ResultsPerPage(id: "50", label: "50")
    ]
}
