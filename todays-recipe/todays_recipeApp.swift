//
//  todays_recipeApp.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/02.
//

import SwiftUI
import ComposableArchitecture

@main
struct todays_recipeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: RecipeSearch.State(),
                    reducer: RecipeSearch()
                )
            )
        }
    }
}
