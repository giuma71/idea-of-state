//
//  IdeaOfStateApp.swift
//  Shared
//
//  Created by Giuseppe Mazzilli on 13/01/22.
//

import SwiftUI

@main
struct IdeaOfStateApp: App {
    var body: some Scene {
        WindowGroup {
            // TestContentView()
            ContentView(viewModel: ContentViewModel(store: Store.shared))
        }
    }
}
