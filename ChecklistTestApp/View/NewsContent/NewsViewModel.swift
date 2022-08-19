//
//  NewsViewModel.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    private var apiService: APIServiceProtocol
    @Published var articles = [Article]()
    @Published var searchText = ""
    
    private var pageSize: Int = 10
    @Published private(set) var currentPage: Int = 1
    @Published private(set) var totalPages: Int = 1
    @Published private(set) var hasPreviousPage: Bool = false
    @Published private(set) var hasNextPage: Bool = false
    
    init(service: APIServiceProtocol) {
        apiService = service
        
        Task {
            let searchResult = await apiService.getEverythingArticles(query: "Brasil", language: nil,
                                                                      sortBy: nil, page: currentPage,
                                                                      pageSize: pageSize)
            await MainActor.run(body: {
                if let searchResult = searchResult {
                    self.articles = searchResult.articles
                }
            })
        }
    }
    
    func nextPage() {
        if hasNextPage {
            currentPage += 1
            search(resetPageCount: false)
        }
    }
    
    func previousPage() {
        if hasPreviousPage {
            currentPage -= 1
            search(resetPageCount: false)
        }
    }
    
    private func updatePageIndicators() {
        hasPreviousPage = currentPage > 1
        hasNextPage = currentPage < totalPages
    }
    
    func search(resetPageCount: Bool = true) {
        guard !searchText.isEmpty else { return }
        if resetPageCount {
            currentPage = 1
        }
        Task {
            let searchTextDecoded = searchText.replacingOccurrences(of: " ", with: "%20")
            let searchResult = await apiService.getEverythingArticles(query: searchTextDecoded, language: nil,
                                                                      sortBy: nil, page: currentPage,
                                                                      pageSize: pageSize)
            await MainActor.run(body: {
                if let searchResult = searchResult {
                    updateResult(searchResult)
                }
            })
        }
    }
    
    private func updateResult(_ result: SearchResult) {
        self.articles = result.articles
        let totalPagesTemp = Double(result.totalResults) / Double(pageSize)
        self.totalPages = Int(totalPagesTemp.rounded(.up))
        updatePageIndicators()
    }
}
