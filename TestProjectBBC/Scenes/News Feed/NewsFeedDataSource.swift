//
//  NewsFeedDataSource.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

protocol NewsFeedDataSourceDelegate: class {
    func didSelect(post: Post)
}

final class NewsFeedDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    weak var delegate: NewsFeedDataSourceDelegate?

    var cellIdentifier: String {
        return String(describing: PostTableViewCell.self)
    }

    // Data

    var posts: [Post] = []

    // MARK: - Initialization

    init(posts: [Post] = []) {
        self.posts = posts
    }

    // MARK: - Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PostTableViewCell else {
            fatalError("Register PostTableViewCell")
        }
        cell.configure(with: posts[indexPath.row])

        return cell
    }
}

extension NewsFeedDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < posts.count else {
            return
        }
        delegate?.didSelect(post: posts[indexPath.row])
    }
}
