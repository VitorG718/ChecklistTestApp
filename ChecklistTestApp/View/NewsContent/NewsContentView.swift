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
                Header(metrics: metrics)
                
                ArticlesContent(newsViewModel: newsViewModel)
                
                Footer()
            }
            .background(.white)
        }
    }
}

struct NewsContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsContentView(newsViewModel: NewsViewModel(service: APIServiceMock()))
    }
}
