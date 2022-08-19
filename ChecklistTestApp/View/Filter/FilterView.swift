//
//  FilterView.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Filtros")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color(uiColor: .darkGray))
                .padding()
                .padding(.bottom, 16)
            
            Button {
                newsViewModel.isTopHeadlineNews.toggle()
            } label: {
                HStack {
                    Text("Trends")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    Image(systemName: "star")
                        .font(.title2.weight(.medium))
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .foregroundColor(newsViewModel.isTopHeadlineNews ? .pink : Color(uiColor: .darkGray))
                }
                .padding(10)
                .background(newsViewModel.isTopHeadlineNews ? .pink : Color(uiColor: .darkGray))
                .cornerRadius(16)
            }
            .frame(height: 45)
            .padding(.bottom, 32)
            
            FilterOption(title: "Resultados por página",
                         options: ResultsPerPage.all,
                         pickerOptionSelected: $newsViewModel.resultsPerPage,
                         disabled: false)
            .padding(.bottom, 16)
            
            FilterOption(title: "Idioma",
                         options: Language.all,
                         pickerOptionSelected: $newsViewModel.language,
                         disabled: newsViewModel.isTopHeadlineNews)
            .padding(.bottom, 16)
            
            FilterOption(title: "Ordenar por",
                         options: SortBy.all,
                         pickerOptionSelected: $newsViewModel.sortBy,
                         disabled: newsViewModel.isTopHeadlineNews)
            .padding(.bottom, 16)
            
            FilterOption(title: "Categoria",
                         options: Category.all,
                         pickerOptionSelected: $newsViewModel.category,
                         disabled: !newsViewModel.isTopHeadlineNews)
            .padding(.bottom, 16)
            
            FilterOption(title: "País",
                         options: Country.all,
                         pickerOptionSelected: $newsViewModel.country,
                         disabled: !newsViewModel.isTopHeadlineNews)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(newsViewModel: NewsViewModel(service: APIServiceMock()))
    }
}
