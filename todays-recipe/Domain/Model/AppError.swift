//
//  AppError.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/05.
//

import Foundation

/// アプリで扱うエラー
enum AppError: Equatable, Error {
    case general
    case unexpected

    var message: String {
        switch self {
        case .general:
            return "もう一度お試しください"
        case .unexpected:
            return "予期せぬエラーが発生しました"
        }
    }
}

// MARK: - factory
extension AppError {
    /// APIエラーから生成
    static func make(error: Error) -> Self {
        guard let error = error as? WebAPIError else { return .unexpected }
        switch error {
        case .general:
            return .general
        }
    }
}
