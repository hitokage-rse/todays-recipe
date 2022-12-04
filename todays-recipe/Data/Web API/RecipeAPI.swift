//
//  RecipeAPI.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/05.
//

import Foundation

/// レシピ検索API
struct RecipeAPI: WebAPI {
    typealias Response = RecipeAPIResponse
    let host: String = "api.github.com"
    let path: String = "/search/repositories"
    let queryItems: [URLQueryItem]

    init(query: String) {
        self.queryItems = [URLQueryItem(name: "q", value: query)]
    }
}

// MARK: - Response
struct RecipeAPIResponse: Codable, Equatable {
    let totalCount: Int
}
