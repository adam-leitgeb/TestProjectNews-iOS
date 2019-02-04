//
//  NewsFeedService.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

protocol NewsFeedService: Service {
}

final class ProductionNewsFeedService {

    // MARK: - Properties

    private let apiAdapter: APIAdapter

    // MARK: - Initialization

    init(apiAdapter: APIAdapter) {
        self.apiAdapter = apiAdapter
    }
}

extension ProductionNewsFeedService: NewsFeedService {
}
