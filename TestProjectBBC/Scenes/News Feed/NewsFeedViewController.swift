//
//  NewsFeedViewController.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

protocol NewsFeedViewControllerInput: class {
    func update(state: NewsFeedViewController.State)
}

final class NewsFeedViewController: UIViewController {

    // MARK: - Types

    enum State {
        case empty
        case loading
        case popupated
    }

    // MARK: - Properties

    weak var coordinator: NewsFeedCoordinator?
    var viewModel: NewsFeedViewModel!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        viewModel.viewDidLoad()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        title = NSLocalizedString("news-feed.title", comment: "News")
    }

    // MARK: - Actions

    // code..
}

extension NewsFeedViewController: NewsFeedViewControllerInput {
    func update(state: NewsFeedViewController.State) {
        switch state {
        case .empty:
            break
        case .loading:
            break
        case .popupated:
            break
        }
    }
}
