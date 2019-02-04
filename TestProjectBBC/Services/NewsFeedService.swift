//
//  NewsFeedService.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

protocol NewsFeedService: Service {
    func fetchNewsFeed(completion: @escaping (Result<NewsFeed>) -> Void)
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

    // MARK: - Calls
    
    func fetchNewsFeed(completion: @escaping (Result<NewsFeed>) -> Void) {
        let request = GetNewsRequest()
        apiAdapter.request(request, modelType: NewsFeed.self) { result in
            do {
                let newsFeed = try result()
                completion(.success(newsFeed))
            } catch {
                completion(.error(error))
            }
        }
    }

    // MARK: - Requests

    struct GetNewsRequest: Request {
        var path: String = "/news"
        var method: HTTPMethod = .get
        var requestData: RequestData = .none
    }
}
