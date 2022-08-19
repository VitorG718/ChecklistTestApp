//
//  ArticleCell.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct ArticleCell: View {
    let article: Article
    
    var body: some View {
        Button {
            if let articleUrl = article.url, let url = URL(string: articleUrl) {
                UIApplication.shared.open(url)
            }
        } label: {
            HStack {
                VStack(spacing: 0) {
                    if let title = article.title {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.pink)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    if let author = article.author {
                        Text("By " + author)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(uiColor: .lightGray))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    if let description = article.description {
                        Text(description)
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.vertical)
                .padding(.leading)
                
                Image(systemName: "chevron.right")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity)
                    .frame(width: 45)
            }
            .background(Color(uiColor: .darkGray))
            .cornerRadius(10)
        }
    }
}
