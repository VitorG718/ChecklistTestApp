//
//  Language.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

struct Language: FilterOptionProtocol {
    let id: String
    let label: String
    
    static let first: String = ""
    static var all: [Language] = [
        Language(id: "", label: "Todos"),
        Language(id: "pt", label: "Português"),
        Language(id: "ar", label: "Árabe"),
        Language(id: "de", label: "Alemão"),
        Language(id: "en", label: "Inglês"),
        Language(id: "es", label: "Espanhol"),
        Language(id: "fr", label: "Francês"),
        Language(id: "he", label: "Hebreu"),
        Language(id: "it", label: "Italiano"),
        Language(id: "nl", label: "Holandês"),
        Language(id: "no", label: "Norueguês"),
        Language(id: "ru", label: "Russo"),
        Language(id: "sv", label: "Sueco"),
        Language(id: "zh", label: "Chinês"),
    ]
}
