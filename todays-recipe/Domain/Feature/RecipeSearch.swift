//
//  RecipeSearch.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/03.
//

import ComposableArchitecture

/// レシピ検索
struct RecipeSearch: ReducerProtocol {
    struct State: Equatable {
        /// レシピ
        var recipe: RecipeAPIResponse?
    }

    enum Action: Equatable {
        /// ランダム検索
        case searchRandomly
        case recipeResponse(TaskResult<RecipeAPIResponse>)
    }

    @Dependency(\.recipeClient) var recipeClient

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .searchRandomly:
            return .task {
                await .recipeResponse(TaskResult { try await self.recipeClient.fetch() })
            }
        case let .recipeResponse(.success(response)):
            state.recipe = response
            return .none
        case let .recipeResponse(.failure(error)):
            print(error.localizedDescription)
            return .none
        }
    }
}
