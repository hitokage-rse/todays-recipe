//
//  Recipe.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/05.
//

import Foundation

/// レシピ
struct Recipe: Equatable {
    /// レシピ名
    var name: String
    /// レシピ画像
    var image: URL
    /// 何人前
    var howManyServings: String
    /// 材料
    var ingredients: [Ingredient]
    /// 手順
    var procedure: [String]
}

struct Ingredient: Equatable {
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
