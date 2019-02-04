//
//  Result.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}
