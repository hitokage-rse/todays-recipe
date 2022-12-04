//
//  AppError.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/05.
//

import Foundation

/// アプリで扱うエラー
struct AppError: Equatable {
    let message: String
}

extension AppError {
    static func makeFromAPI() -> Self {
        AppError(message: "もう一度お試しください")
    }
}
