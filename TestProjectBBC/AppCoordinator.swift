//
//  AppCoordinator.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator {

    // MARK: - Properties

    let window: UIWindow

    private lazy var serviceHolder: ServiceHolder = {
        let apiAdapter = APIAdapter()

        let serviceHolder = ServiceHolder()
        serviceHolder.add(AnalyticsService.self) {
            ProductionAnalyticsService(apiAdapter: apiAdapter)
        }
        serviceHolder.add(NewsFeedService.self) {
            ProductionNewsFeedService(apiAdapter: apiAdapter, analyticsService: serviceHolder.get())
        }
        
        return serviceHolder
    }()

    // MARK: - Init

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.backgroundColor = .white
        self.window.makeKeyAndVisible()
    }

    // MARK: - Lifecycle

    func start() {
        showNewsFeed()
    }

    // MARK: - Navigation

    private func showNewsFeed() {
        let coordinator = NewsFeedCoordinator(window: window, serviceHolder: serviceHolder)
        coordinator.start()
    }
}
