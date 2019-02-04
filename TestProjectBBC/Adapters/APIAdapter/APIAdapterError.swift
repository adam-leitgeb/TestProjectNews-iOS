//
//  APIAdapterError.swift
//  CryptoTrader
//
//  Created by Adam Leitgeb on 04/12/2018.
//  Copyright © 2018 Adam Leitgeb. All rights reserved.
//

import Foundation

public enum APIAdapterError: Error {
    case custom(message: String)
    case invalidData
    case missingToken
    case unknown
}

public extension APIAdapterError: Decodable {
    private enum Keys: String, CodingKey {
        case success
        case message
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)

        if try container.decode(Bool.self, forKey: .success) {
            throw APIAdapterError.unknown
        } else {
            let message = try container.decode(String.self, forKey: .message)
            self = .custom(message: message)
        }
    }
}

public extension APIAdapterError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .custom(let message):
            return message
        case .invalidData:
            return NSLocalizedString("APIAdapterError.invalidStructure", comment: "We are sorry, but server...")
        case .missingToken:
            return nil
        case .unknown:
            return NSLocalizedString("APIAdapterError.unknown", comment: "We are sorry, but some unknown...")
        }
    }
}
