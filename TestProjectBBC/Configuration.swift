//
//  Configuration.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

extension Request {
    var token: String? {
        return nil
    }

    var authentization: Authentization {
        return .none
    }

    var baseURL: URL {
        return URL(string: "http://private-4f03bd-bbctestproject.apiary-mock.com")!
    }
}
