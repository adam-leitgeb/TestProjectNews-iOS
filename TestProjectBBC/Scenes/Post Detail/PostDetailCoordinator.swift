//
//  PostDetailCoordinator.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation
import UIKit

protocol PostDetailCoordinatorInput: CoordinatorInput {
}

final class PostDetailCoordinator: PushCoordinator {

    // MARK: - Properties

    weak var navigationController: UINavigationController?
    let viewController: PostDetailViewController

    private let post: Post

    // MARK: - Initialization

    init(navigationController: UINavigationController, post: Post) {
        viewController = PostDetailViewController()
        self.navigationController = navigationController
        self.post = post
    }

    // MARK: - Utilities

    func configure(viewController: PostDetailViewController) {
        viewController.coordinator = self
        viewController.viewModel = PostDetailViewModel(
            coordinator: self,
            viewController: viewController,
            post: post
        )
    }
}

extension PostDetailCoordinator: PostDetailCoordinatorInput {
}
