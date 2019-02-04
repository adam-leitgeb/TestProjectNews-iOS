//
//  LoadingStatePluginViewController.swift
//  TestProjectBBC
//
//  Created by Adam Leitgeb on 04/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

class LoadingStatePluginViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.activityIndicatorView.isHidden = false
        }
    }
}
