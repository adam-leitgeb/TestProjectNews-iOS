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

    // MARK: - Utilities

    private func loadData() {
        // code..
    }
}
