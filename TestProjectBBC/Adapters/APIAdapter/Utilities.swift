//
//  Dictionary+APIAdapter.swift
//  CryptoTrader
//
//  Created by Adam Leitgeb on 04/12/2018.
//  Copyright © 2018 Adam Leitgeb. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value: Any {
    var queryString: String? {
        var components = URLComponents()
        components.queryItems = map {
            URLQueryItem(name: $0, value: String(describing: $1))
        }
        return components.url?.absoluteString
    }

    var urlEncodedString: String? {
        guard let urlEncoded = self.queryString?.dropFirst() else {
            return nil
        }
        return String(urlEncoded)
    }
}
