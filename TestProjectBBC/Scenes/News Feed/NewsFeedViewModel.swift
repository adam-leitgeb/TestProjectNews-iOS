//
//  NewsFeedViewModel.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

final class NewsFeedViewModel {

    // MARK: - Properties

    private let coordinator: NewsFeedCoordinatorInput
    private weak var viewController: NewsFeedViewControllerInput?

    private let newsFeedService: NewsFeedService
    private let analyticsService: AnalyticsService

    // MARK: - Initialization

    init(coordinator: NewsFeedCoordinatorInput, viewController: NewsFeedViewControllerInput, newsFeedService: NewsFeedService, analyticsService: AnalyticsService) {
        self.coordinator = coordinator
        self.viewController = viewController
        self.newsFeedService = newsFeedService
        self.analyticsService = analyticsService
    }

    // MARK: - Actions

    func viewDidLoad() {
        viewController?.update(state: .loading)
        loadData()
    }

    func viewDidAppear() {
        analyticsService.logScene(sceneId: "news-feed")
    }

    func reloadTapped() {
        loadData()
    }

    func pullToRefreshInitiated() {
        loadData()
    }

    func didSelect(post: Post) {
        coordinator.showPostDetail(post: post)
    }

    // MARK: - Utilities

    private func loadData() {
        newsFeedService.fetchNewsFeed { [weak self] result in
            switch result {
            case .success(let newsFeed):
                self?.viewController?.update(state: .populated(posts: newsFeed.headlines))
            case .error(let error):
                self?.viewController?.update(state: .error(error))
            }
            self?.viewController?.endRefreshing()
        }
    }
}
