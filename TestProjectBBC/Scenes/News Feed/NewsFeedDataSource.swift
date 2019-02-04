//
//  NewsFeedDataSource.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

final class NewsFeedDataSource: NSObject, UITableViewDataSource {

    // MARK: - Properties

    var posts: [Post] = []

    var cellIdentifier: String {
        return String(describing: PostTableViewCell.self)
    }

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
