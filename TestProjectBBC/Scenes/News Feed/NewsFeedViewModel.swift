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

    // MARK: - Initialization

    init(coordinator: NewsFeedCoordinatorInput, viewController: NewsFeedViewControllerInput, newsFeedService: NewsFeedService) {
        self.coordinator = coordinator
        self.viewController = viewController
        self.newsFeedService = newsFeedService
    }

    // MARK: - Actions

    func viewDidLoad() {
        viewController?.update(state: .loading)
        loadData()
    }

    func reloadTapped() {
        loadData()
    }

    // MARK: - Utilities

    private func loadData() {
        newsFeedService.fetchNewsFeed { [weak self] result in
            switch result {
            case .success(let newsFeed):
                let headlines = newsFeed.headlines
                print(headlines.count, "of headlines loaded.")
                // TODO: - Map posts to cell models and update viewController
            case .error(let error):
                self?.viewController?.update(state: .error(error))
            }
        }
    }
}
