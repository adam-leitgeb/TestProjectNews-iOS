//
//  ErrorStatePluginViewController.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

class ErrorStatePluginViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var contentContainerStackView: UIStackView!

    // MARK: - Properties

    private var actionTitle: String?
    private var actionHandler: (() -> Void)?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialAppearance()
        setupTexts()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animateAppearance()
    }

    // MARK: - Setup

    private func setupInitialAppearance() {
        actionButton.layer.cornerRadius = 8.0

        // prepare for animated appearance of the controls
        contentContainerStackView.alpha = 0
        contentContainerStackView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }

    private func setupTexts() {
        titleLabel.text = title
        actionButton.setTitle(actionTitle, for: .normal)
    }

    // MARK: - Configuration

    func configure(title: String, actionTitle: String, actionHandler: @escaping () -> Void) {
        self.title = title
        self.actionTitle = actionTitle
        self.actionHandler = actionHandler
    }

    // MARK: - Actions

    @IBAction private func actionButtonTapped(_ sender: Any) {
        actionHandler?()
        actionHandler = nil
    }

    // MARK: - Utilities

    private func animateAppearance() {
        UIView.animate(
            withDuration: 0.2,
            delay: 0.05,
            options: .curveEaseOut,
            animations: {
                self.contentContainerStackView.alpha = 1.0
                self.contentContainerStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            },
            completion: nil
        )
    }
}
