//
//  APIServiceProtocol.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 18/08/22.
//

import Foundation

protocol APIServiceProtocol: AnyObject {
    func getEverythingArticles(
        query: String?, language: String?, sortBy: String?,
        page: Int, pageSize: Int
    ) async -> SearchResult?
    
    func getTopHeadlineArticles(
        query: String?, country: String?, category: String?,
        page: Int, pageSize: Int
    ) async -> SearchResult?
}
