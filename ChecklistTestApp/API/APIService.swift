//
//  APIService.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 18/08/22.
//

import Foundation
import Alamofire

class APIService: APIServiceProtocol {
    private let everythingBaseUrl = "https://newsapi.org/v2/everything"
    private let topHeadlinesBaseUrl = "https://newsapi.org/v2/top-headlines"
    private static let appKey = ""
    
    func getEverythingArticles(
        query: String?, language: String?, sortBy: String?,
        page: Int, pageSize: Int
    ) async -> SearchResult? {
        let parameters = [
            (query != nil ? "q=\(query!)" : nil),
            (language != nil ? "language=\(language!)" : nil),
            (sortBy != nil ? "sortBy=\(sortBy!)" : nil),
            "pageSize=\(pageSize)", "page=\(page)"
        ].compactMap({ $0 }).joined(separator: "&")
        
        let uri = String("?")
            .appending(parameters.isEmpty ? "" : parameters)
        
        return await getRequest(with: everythingBaseUrl, uri: uri)
    }
    
    func getTopHeadlineArticles(
        query: String?, country: String?, category: String?,
        page: Int, pageSize: Int
    ) async -> SearchResult? {
        let parameters = [
            (query != nil ? "q=\(query!)" : nil),
            (country != nil ? "country=\(country!)" : nil),
            (category != nil ? "category=\(category!)" : nil),
            "pageSize=\(pageSize)", "page=\(page)"
        ].compactMap({ $0 }).joined(separator: "&")
        
        let uri = String("?")
            .appending(parameters.isEmpty ? "" : parameters)
        
        return await getRequest(with: topHeadlinesBaseUrl, uri: uri)
    }
    
    private func getRequest(with baseUrl: String, uri: String) async -> SearchResult? {
        let headers: HTTPHeaders = [
            HTTPHeader.authorization("ab454fd5e0f24ae1bcb24b97594dd3ec")
        ]
        let request = AF.request(baseUrl + uri, method: .get, headers: headers)
        
        return await withCheckedContinuation({ (continuation: CheckedContinuation<SearchResult?, Never>) in
            request.responseData { response in
                guard response.response?.statusCode == 200 else {
                    continuation.resume(returning: nil)
                    return
                }
                
                switch response.result {
                case .success(let data):
                    if let dataDecoded = try? JSONDecoder().decode(SearchResult.self, from: data) {
                        continuation.resume(returning: dataDecoded)
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(_):
                    continuation.resume(returning: nil)
                }
            }
        })
    }
}
