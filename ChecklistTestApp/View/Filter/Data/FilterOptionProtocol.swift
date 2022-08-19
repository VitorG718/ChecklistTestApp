//
//  FilterOptionProtocol.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 19/08/22.
//

import Foundation

protocol FilterOptionProtocol: Identifiable {
    var id: String { get }
    var label: String { get }
    static var first: String { get }
}
