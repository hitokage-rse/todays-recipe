//
//  RecipeClient.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/03.
//

import Dependencies

struct RecipeClient {
    var fetch: @Sendable () async throws -> RecipeAPIResponse
}

extension DependencyValues {
    var recipeClient: RecipeClient {
      get { self[RecipeClient.self] }
      set { self[RecipeClient.self] = newValue }
    }
}

extension RecipeClient: DependencyKey {
    static let liveValue: RecipeClient = Self(
        fetch: {
            try await APIClient.shared.request(api: RecipeAPI(query: "todays-recipe"))
        }
    )
}
