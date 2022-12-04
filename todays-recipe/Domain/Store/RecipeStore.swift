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
    struct Recipe: Equatable {
        /// レシピ名
        var name: String
        /// レシピ画像
        var image: URL
        /// 何人前
        var howManyServings: String
        /// 材料
        var materials: [String]
        /// 手順
        var procedure: [String]
    }

    struct Material: Equatable {
        /// 材料名
        var name: String
        /// 分量
        var quantity: String
    }

    struct Procedure: Equatable {
        /// ステップ
        var step: String
        /// 説明文
        var description: String
    }
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
