//
//  Footer.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        HStack {
            Button {
                // TODO: Back page
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2.bold())
                    .foregroundColor(Color(uiColor: .darkGray))
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .frame(width: 45, height: 45)
            .background(Color.white)
            .cornerRadius(10)
            
            Spacer()
            Text("Páginas 1 de 5")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            Button {
                // TODO: Next page
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title2.bold())
                    .foregroundColor(Color(uiColor: .darkGray))
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
            }
            .frame(width: 45, height: 45)
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.vertical)
        .padding(.horizontal, 32)
        .background(.pink)
    }
}
