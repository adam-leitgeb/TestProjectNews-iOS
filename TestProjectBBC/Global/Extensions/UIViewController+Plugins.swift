//
//  UIViewController+Plugins.swift
//  AKit
//
//  Created by Adam Leitgeb on 18/01/2019.
//

import UIKit

public extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        child.view.frame = view.bounds
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

