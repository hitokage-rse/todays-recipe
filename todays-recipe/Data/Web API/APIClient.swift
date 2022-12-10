//
//  APIClient.swift
//  todays-recipe
//
//  Created by kagehito on 2022/12/04.
//

import Foundation

protocol APIRequestable {
    func request<API: WebAPI>(api: API) async throws -> API.Response
}

final class APIClient: APIRequestable {
    static let shared = APIClient()
    private init() {}

    private let session = URLSession.shared
    lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

extension APIClient {
    func request<API: WebAPI>(api: API) async throws -> API.Response {
        let request = URLRequest(url: api.requestURL)
        let (data, response) = try await session.data(for: request)
        if let response = response as? HTTPURLResponse, !response.isSuccessCode {
            throw WebAPIError.general
        }
        return try decoder.decode(API.Response.self, from: data)
    }
}

private extension HTTPURLResponse {
    /// 200,201以外は失敗とみなす
    var isSuccessCode: Bool {
        return statusCode == 200 || statusCode == 201
    }
}
