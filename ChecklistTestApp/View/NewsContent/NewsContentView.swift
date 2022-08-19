//
//  NewsContentView.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 17/08/22.
//

import SwiftUI

struct NewsContentView: View {
    @StateObject var newsViewModel: NewsViewModel
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Header(newsViewModel: newsViewModel, metrics: metrics)
                
                ArticlesContent(newsViewModel: newsViewModel)
                
                Footer(newsViewModel: newsViewModel)
            }
            .background(.white)
        }
        .sheet(isPresented: $newsViewModel.showFilterView, onDismiss: {
            newsViewModel.search()
        }, content: {
            FilterView(newsViewModel: newsViewModel)
        })
    }
}

struct NewsContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsContentView(newsViewModel: NewsViewModel(service: APIServiceMock()))
    }
}
