//
//  RequestData.swift
//  CryptoTrader
//
//  Created by Adam Leitgeb on 04/12/2018.
//  Copyright © 2018 Adam Leitgeb. All rights reserved.
//

import Foundation

enum RequestData {
    case jsonBody(Parameters)
    case json(body: Parameters, query: Parameters)
    case urlEncoded(parameters: Parameters)
}
