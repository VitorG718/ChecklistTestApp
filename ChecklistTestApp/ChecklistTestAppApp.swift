//
//  ChecklistTestAppApp.swift
//  ChecklistTestApp
//
//  Created by Vitor Souza on 17/08/22.
//

import SwiftUI

@main
struct ChecklistTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            NewsContentView(newsViewModel: NewsViewModel(service: APIServiceMock()))
        }
    }
}
