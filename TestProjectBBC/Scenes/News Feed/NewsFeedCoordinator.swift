//
//  NewsFeedCoordinator.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation
import UIKit

protocol NewsFeedCoordinatorInput: CoordinatorInput {
    func showPostDetail(post: Post)
}

final class NewsFeedCoordinator: Coordinator {

    // MARK: - Properties

    private let window: UIWindow
    private let navigationController: UINavigationController
    let viewController: NewsFeedViewController

    private let serviceHolder: ServiceHolder

    // MARK: - Initialization

    init(window: UIWindow, serviceHolder: ServiceHolder) {
        self.window = window
        viewController = NewsFeedViewController()
        navigationController = UINavigationController(rootViewController: viewController)
        self.serviceHolder = serviceHolder
    }

    // MARK: - Actions

    func start() {
        configure(viewController: viewController)
        window.rootViewController = navigationController
    }

    func stop() {
    }

    // MARK: - Utilities

    func configure(viewController: NewsFeedViewController) {
        viewController.coordinator = self
        viewController.viewModel = NewsFeedViewModel(
            coordinator: self,
            viewController: viewController,
            newsFeedService: serviceHolder.get(),
            analyticsService: serviceHolder.get()
        )
    }
}

extension NewsFeedCoordinator: NewsFeedCoordinatorInput {
    func showPostDetail(post: Post) {
        let coordinator = PostDetailCoordinator(
            navigationController: navigationController,
            serviceHolder: serviceHolder,
            post: post
        )
        coordinator.start()
    }
}
