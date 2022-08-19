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
    
    @Published private(set) var currentPage: Int = 1
    @Published private(set) var totalPages: Int = 1
    @Published private(set) var hasPreviousPage: Bool = false
    @Published private(set) var hasNextPage: Bool = false
    
    @Published var showFilterView: Bool = false
    @Published var isTopHeadlineNews: Bool = false
    @Published var resultsPerPage: String = ResultsPerPage.first
    @Published var language: String = Language.first
    @Published var sortBy: String = SortBy.first
    @Published var category: String = Category.first
    @Published var country: String = Country.first
    
    init(service: APIServiceProtocol) {
        apiService = service
        
        Task {
            let searchResult = await apiService.getEverythingArticles(query: "Brasil", language: nil,
                                                                      sortBy: nil, page: 1,
                                                                      pageSize: 10)
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
        if resetPageCount {
            currentPage = 1
        }
        
        Task {
            let searchTextDecoded = searchText
                .trimmingCharacters(in: .whitespaces)
                .replacingOccurrences(of: " ", with: "%20")
            var searchResult: SearchResult? = nil
            
            if isTopHeadlineNews && !searchText.isEmpty {
                let languague = self.language.isEmpty ? nil : self.language
                let sortBy = self.sortBy.isEmpty ? nil : self.sortBy
                searchResult = await apiService.getEverythingArticles(query: searchTextDecoded, language: languague,
                                                                      sortBy: sortBy, page: currentPage,
                                                                      pageSize: Int(resultsPerPage) ?? 10)
            } else {
                let category = self.category.isEmpty ? nil : self.category
                let country = self.country.isEmpty ? nil : self.country
                let searchText = self.searchText.isEmpty ? nil : self.searchText
                searchResult = await apiService.getTopHeadlineArticles(query: searchText, country: country,
                                                                       category: category, page: currentPage,
                                                                       pageSize: Int(resultsPerPage) ?? 10)
            }
            
            await MainActor.run(body: { [searchResult] in
                if let searchResult = searchResult {
                    updateResult(searchResult)
                }
            })
        }
    }
    
    private func updateResult(_ result: SearchResult) {
        self.articles = result.articles
        let totalPagesTemp = Double(result.totalResults) / Double(Int(resultsPerPage) ?? 10)
        self.totalPages = Int(totalPagesTemp.rounded(.up))
        updatePageIndicators()
    }
}
