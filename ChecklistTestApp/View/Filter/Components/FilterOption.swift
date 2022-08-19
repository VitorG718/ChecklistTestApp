//
//  FilterOption.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import SwiftUI

struct FilterOption<T: FilterOptionProtocol>: View {
    let title: String
    let options: [T]
    @Binding var pickerOptionSelected: String
    var disabled: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(disabled ? Color(uiColor: .lightGray) : Color.white)
            .overlay {
                HStack {
                    Text(title)
                        .font(.body)
                        .foregroundColor(Color(uiColor: .darkGray))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Picker("", selection: $pickerOptionSelected) {
                        ForEach(options) { option in
                            Text(option.label).tag(option.id)
                        }
                    }
                    .disabled(disabled)
                }
                .padding(.horizontal)
            }
            .frame(height: 45)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(uiColor: .darkGray), lineWidth: 2)
            }
    }
}
