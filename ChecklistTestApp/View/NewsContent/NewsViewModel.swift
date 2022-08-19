//
//  NewsViewModel.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles = [Article]()
    private var apiService: APIServiceProtocol
    
    init(service: APIServiceProtocol) {
        apiService = service
        
        Task {
            let searchResult = await apiService.getEverythingArticles(query: "", language: "", sortBy: "", page: 1, pageSize: 13)
            await MainActor.run(body: {
                if let articles = searchResult?.articles {
                    self.articles = articles
                }
            })
        }
    }
}
