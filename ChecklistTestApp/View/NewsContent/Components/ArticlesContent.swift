//
//  ArticlesContent.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct ArticlesContent: View {
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(newsViewModel.articles) { article in
                    ArticleCell(article: article)
                }
            }
            .padding(.horizontal, 32)
        }
    }
}
