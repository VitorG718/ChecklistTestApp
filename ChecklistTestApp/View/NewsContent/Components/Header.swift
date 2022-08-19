//
//  Header.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct Header: View {
    @State var searchText: String = ""
    var metrics: GeometryProxy
    
    var body: some View {
        Rectangle()
            .fill( LinearGradient(colors: [.pink, .white],
                                  startPoint: .center,
                                  endPoint: .bottom))
            .frame(maxWidth: .infinity)
            .frame(height: metrics.size.height * 0.25)
            .background(Color.pink)
            .overlay {
                VStack {
                    HStack {
                        Text("Notícias")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        
                        Spacer()
                        
                        Button {
                            // TODO: Filter
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity)
                        }
                        .frame(width: 45, height: 45)
                    }
                    .padding()
                    
                    HStack {
                        TextField("Pesquise aqui", text: $searchText)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        Button {
                            // TODO: Search
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title2.bold())
                                .foregroundColor(Color(uiColor: .darkGray))
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity)
                        }
                        .frame(width: 45, height: 45)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .padding()
                    Spacer()
                }
            }
    }
}
