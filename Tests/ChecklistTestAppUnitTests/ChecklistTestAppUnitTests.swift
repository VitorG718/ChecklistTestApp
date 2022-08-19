//
//  ChecklistTestAppUnitTests.swift
//  ChecklistTestAppUnitTests
//
//  Created by Vitor Souza on 18/08/22.
//

import XCTest
@testable import ChecklistTestApp

class ChecklistTestAppUnitTests: XCTestCase {
    
    func test_APIService_withTopHeadlineArticles_shouldHaveThreeArticles() async {
        let resultFromApi = await APIService().getTopHeadlineArticles(query: nil, country: "br",
                                                                      category: nil, page: 1, pageSize: 3)
        let resultFromMock = await APIServiceMock().getTopHeadlineArticles(query: nil, country: "br",
                                                                           category: nil, page: 1, pageSize: 3)
        
        XCTAssertEqual(resultFromApi?.articles.count, 3)
        XCTAssertEqual(resultFromMock?.articles.count, 3)
    }
    
    func test_APIService_withEverythingArticles_shouldHaveFiveArticles() async {
        let resultFromApi = await APIService().getEverythingArticles(query: "valor", language: "pt",
                                                                     sortBy: "publishedAt", page: 1, pageSize: 5)
        let resultFromMock = await APIServiceMock().getEverythingArticles(query: "valor", language: "pt",
                                                                          sortBy: "publishedAt", page: 1, pageSize: 5)
        
        XCTAssertEqual(resultFromApi?.articles.count, 5)
        XCTAssertEqual(resultFromMock?.articles.count, 5)
    }
}
