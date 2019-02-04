//
//  CoordinatorInput.swift
//  AKit
//
//  Created by Adam Leitgeb on 17/01/2019.
//

import UIKit

public protocol CoordinatorInput: class {
    func showAlert(for error: Error)
    func dismiss()
}

public extension Coordinator {
    func showAlert(for error: Error) {
        let alert: UIAlertController = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        alert.addAction(.closeAction)
        viewController.present(alert, animated: true, completion: nil)
    }

    func dismiss() {
        stop()
    }
}

