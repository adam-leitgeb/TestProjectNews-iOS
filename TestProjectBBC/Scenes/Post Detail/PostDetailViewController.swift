//
//  PostDetailViewController.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright (c) 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

protocol PostDetailViewControllerInput: class {
    func updateArticle(with text: String, lastUpdate: String)
    func updatePageTitle(_ title: String)
}

final class PostDetailViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var contentTextView: UITextView!

    // MARK: - Properties

    weak var coordinator: PostDetailCoordinator?
    var viewModel: PostDetailViewModel!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextView()
        viewModel.viewDidLoad()
    }

    // MARK: - Setup

    private func setupTextView() {
        contentTextView.contentInset = UIEdgeInsets(top: 22, left: 16, bottom: 22, right: 16)
    }
}

extension PostDetailViewController: PostDetailViewControllerInput {
    func updateArticle(with text: String, lastUpdate: String) {
        contentTextView.text = "Last update: " + lastUpdate + "\n\n" + text
    }

    func updatePageTitle(_ title: String) {
        self.title = title
    }
}
