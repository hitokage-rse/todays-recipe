//
//  WebAPI.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/04.
//

import Foundation

protocol WebAPI {
    associatedtype Response: Decodable
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension WebAPI {
    var requestURL: URL {
        var component = URLComponents()
        component.scheme = "https"
        component.host = host
        component.path = path
        if !queryItems.isEmpty {
            component.queryItems = queryItems
        }

        return component.url!
    }
}

// MARK: - Error

enum WebAPIError: Error {
    case general
}
