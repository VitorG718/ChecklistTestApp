//
//  APIServiceMock.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 18/08/22.
//

import Foundation

class APIServiceMock: APIServiceProtocol {
    func getEverythingArticles(
        query: String?, language: String?, sortBy: String?,
        page: Int, pageSize: Int
    ) async -> SearchResult? {
        let fileUrl = Bundle.main.url(forResource: "EverythingSearchResult", withExtension: "json")
        guard let fileUrl = fileUrl else { return nil }
        guard let data = try? Data(contentsOf: fileUrl) else {
            return nil
        }
        return try? JSONDecoder().decode(SearchResult.self, from: data)
    }
    
    func getTopHeadlineArticles(
        query: String?, country: String?, category: String?,
        page: Int, pageSize: Int
    ) async -> SearchResult? {
        let fileUrl = Bundle.main.url(forResource: "TopHeadlinesSearchResult", withExtension: "json")
        guard let fileUrl = fileUrl else { return nil }
        guard let data = try? Data(contentsOf: fileUrl) else {
            return nil
        }
        return try? JSONDecoder().decode(SearchResult.self, from: data)
    }
}
