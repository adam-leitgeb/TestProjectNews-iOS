//
//  Request.swift
//  CryptoTrader
//
//  Created by Adam Leitgeb on 04/12/2018.
//  Copyright © 2018 Adam Leitgeb. All rights reserved.
//

import Foundation

protocol Request {
    var token: String? { get }
    var authentization: Authentization { get }

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var requestData: RequestData { get }
}
