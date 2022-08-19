//
//  Footer.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct Footer: View {
    @ObservedObject var newsViewModel: NewsViewModel
    
    var body: some View {
        HStack {
            Button {
                newsViewModel.previousPage()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2.bold())
                    .foregroundColor(Color(uiColor: .darkGray))
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .frame(width: 45, height: 45)
            .background(newsViewModel.hasPreviousPage ? Color.white : Color(uiColor: .lightGray))
            .cornerRadius(10)
            .disabled(!newsViewModel.hasPreviousPage)
            
            Spacer()
            Text("Páginas \(newsViewModel.currentPage) de \(newsViewModel.totalPages)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            Button {
                newsViewModel.nextPage()
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title2.bold())
                    .foregroundColor(Color(uiColor: .darkGray))
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .frame(width: 45, height: 45)
            .background(newsViewModel.hasNextPage ? Color.white : Color(uiColor: .lightGray))
            .cornerRadius(10)
            .disabled(!newsViewModel.hasNextPage)
        }
        .padding(.vertical)
        .padding(.horizontal, 32)
        .background(.pink)
    }
}
