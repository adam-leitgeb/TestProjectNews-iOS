//
//  PostTableViewCell.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var sourceLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var postedLabel: UILabel!

    // MARK: - Configuration

    func configure(with post: Post) {
        sourceLabel.text = "BBC"
        titleLabel.text = post.headline

        let updatedDate = Date.init(timeIntervalSince1970: TimeInterval(post.updated))
        postedLabel.text = getDateString(for: updatedDate)
    }

    private func getDateString(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: date)
    }
}
