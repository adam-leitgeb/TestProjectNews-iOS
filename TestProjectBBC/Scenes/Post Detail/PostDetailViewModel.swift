//
//  PostDetailViewModel.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import Foundation

final class PostDetailViewModel {

    // MARK: - Properties

    private let coordinator: PostDetailCoordinatorInput
    private weak var viewController: PostDetailViewControllerInput?

    private let analyticsService: AnalyticsService
    private let post: Post

    // MARK: - Initialization

    init(coordinator: PostDetailCoordinatorInput, viewController: PostDetailViewControllerInput, analyticsService: AnalyticsService, post: Post) {
        self.coordinator = coordinator
        self.viewController = viewController
        self.analyticsService = analyticsService
        self.post = post
    }

    // MARK: - Actions

    func viewDidLoad() {
        viewController?.updatePageTitle(post.headline)
        viewController?.updateArticle(with: post.introduction, lastUpdate: lastUpdateString)
    }

    func viewDidAppear() {
        analyticsService.logScene(sceneId: "post-detail")
    }

    // MARK: - Utilities

    private var lastUpdateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(post.updated)))
    }
}
