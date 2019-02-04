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
        case error(Error)
        case loading
        case populated(posts: [Post])
    }

    // MARK: - Properties

    weak var coordinator: NewsFeedCoordinator?
    var viewModel: NewsFeedViewModel!

    private var dataSource = NewsFeedDataSource()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        viewModel.viewDidLoad()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        title = NSLocalizedString("news-feed.title", comment: "News")
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupTableView(_ tableView: UITableView?) {
        guard let tableView = tableView else {
            return
        }
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = dataSource

        let nib = UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: dataSource.cellIdentifier)
    }

    // MARK: - Actions

    // code..
}

extension NewsFeedViewController: NewsFeedViewControllerInput {
    func update(state: NewsFeedViewController.State) {
        switch state {
        case .empty:
            displayEmptyPlugin()
        case .error(let error):
            displayErrorPlugin(with: error)
        case .loading:
            displayLoadingPlugin()
        case .populated(let posts):
            dataSource.posts = posts
            displayContentPluginIfNeeded()
        }
    }

    // MARK: - Utilities

    private func displayContentPluginIfNeeded() {
        let tableViewPlugin = children.last as? UITableViewController ?? UITableViewController()
        let tableView = tableViewPlugin.tableView

        if children.last as? UITableViewController == nil {
            setupTableView(tableView)
            children.last?.remove()
            add(tableViewPlugin)
        }

        tableView?.reloadData()
    }

    private func displayEmptyPlugin() {
        children.last?.remove()

        let emptyPluginController = ErrorStatePluginViewController()
        emptyPluginController.configure(
            title: NSLocalizedString("news-feed.empty-state.title", comment: "No news."),
            actionTitle: NSLocalizedString("news-feed.empty-state.action", comment: "Reload"),
            actionHandler: { [weak self] in
                self?.viewModel.reloadTapped()
            }
        )

        add(emptyPluginController)
    }

    private func displayErrorPlugin(with error: Error) {
        children.last?.remove()

        let errorPluginController = ErrorStatePluginViewController()
        errorPluginController.configure(
            title: error.localizedDescription,
            actionTitle: NSLocalizedString("news-feed.error-state.action", comment: "Reload"),
            actionHandler: { [weak self] in
                self?.viewModel.reloadTapped()
            }
        )

        add(errorPluginController)
    }

    private func displayLoadingPlugin() {
        children.last?.remove()

        let loadingPlugin = LoadingStatePluginViewController()
        add(loadingPlugin)
    }
}
