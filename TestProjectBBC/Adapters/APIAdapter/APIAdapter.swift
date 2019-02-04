//
//  APIAdapter.swift
//  CryptoTrader
//
//  Created by Adam Leitgeb on 04/12/2018.
//  Copyright © 2018 Adam Leitgeb. All rights reserved.
//

import Foundation

class APIAdapter {

    // MARK: - Properties

    private let decoder = JSONDecoder()

    // MARK: - Actions

    func request<T: Codable>(_ request: Request, modelType: T.Type, completion: @escaping (() throws -> T) -> Void) {
        execute(request: request) { (data: Data?, error: Error?) in
            DispatchQueue.main.async {
                if let error = error {
                    completion({ throw error })
                } else if let data = data {
                    completion({ try self.decoder.decode(modelType, from: data) })
                } else {
                    completion({ throw APIAdapterError.unknown })
                }
            }
        }
    }

    private func execute(request: Request, completion: @escaping (Data?, Error?) -> Void) {
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path))
        urlRequest.httpMethod = request.method.rawValue

        if let token = request.token {
            urlRequest.setValue(request.authentization.rawValue + token, forHTTPHeaderField: "Authorization")
        }

        switch request.requestData {
        case .urlEncoded(let parameters):
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = parameters.urlEncodedString?.data(using: .utf8)
        case .jsonBody(let body):
            urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        case let .json(body, query):
            if let queryString = query.queryString {
                urlRequest.url = urlRequest.url?.appendingPathComponent(queryString)
            }
            urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        case .none:
            break
        }

        URLSession.shared.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(nil, error)
            } else if let data = data, response != nil {
                if let error = try? self.decoder.decode(APIAdapterError.self, from: data) {
                    completion(nil, error)
                } else {
                    completion(data, nil)
                }
            } else if let response = response as? HTTPURLResponse, response.statusCode >= 400 {
                // FIXME: - Make cases for 4xx & 5xx status codes
                completion(nil, APIAdapterError.unknown)
            } else {
                completion(nil, APIAdapterError.unknown)
            }
        }.resume()
    }
}
