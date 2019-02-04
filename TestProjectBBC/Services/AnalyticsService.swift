//
//  AnalyticsService.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

protocol AnalyticsService: Service {
    func logRequest(time: TimeInterval)
    func logScene(sceneId: String)
}

final class ProductionAnalyticsService {

    // MARK: - Properties

    private let apiAdapter: APIAdapter

    // MARK: - Initialization

    init(apiAdapter: APIAdapter) {
        self.apiAdapter = apiAdapter
    }
}

extension ProductionAnalyticsService: AnalyticsService {

    // MARK: - Type

    struct EmptyResponse: Codable {
    }

    // MARK: - Calls

    func logScene(sceneId: String) {
        let request = LogSceneRequest(sceneId: sceneId)
        apiAdapter.request(request, modelType: EmptyResponse.self) { _ in
        }
    }

    func logRequest(time: TimeInterval) {
        let request = LogRequestTimeRequest(time: time)
        apiAdapter.request(request, modelType: EmptyResponse.self) { _ in
        }
    }

    // Requests

    struct LogSceneRequest: Request {
        var path: String = ""
        var method: HTTPMethod = .get
        var requestData: RequestData

        init(sceneId: String) {
            requestData = .urlEncoded(parameters: ["event": "display-\(sceneId)"])
        }
    }

    struct LogRequestTimeRequest: Request {
        var path: String = ""
        var method: HTTPMethod = .get
        var requestData: RequestData

        init(time: TimeInterval) {
            requestData = .urlEncoded(parameters: ["time": time])
        }
    }
}
