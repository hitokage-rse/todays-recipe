//
//  RecipeStore.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/03.
//

import Foundation
import ComposableArchitecture

// MARK: - State

struct RecipeState: Equatable {
    /// レシピ
    var recipe: Recipe
}

// MARK: - Action
enum RecipeAction: Equatable {
    /// ランダム検索
    case searchRandomly
}

// MARK: - Reducer
let recipeReducer = AnyReducer<RecipeState, RecipeAction, RecipeEnvironment> { state, action, _ in
    switch action {
    case .searchRandomly:
        return .none
    }
}
