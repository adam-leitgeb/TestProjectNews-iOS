//
//  Coordinator.swift
//  AKit
//
//  Created by Adam Leitgeb on 17/01/2019.
//

import UIKit

// MARK: - Coordinator

protocol Coordinator {
    associatedtype ViewController: UIViewController

    var viewController: ViewController { get }

    func configure(viewController: ViewController)
    func start()
    func stop()
}

// MARK: - Modal Coordinator

protocol ModalCoordinator: Coordinator {
    var sourceController: UIViewController? { get }
    var navigationController: UINavigationController { get }
    var animated: Bool { get }
}

extension ModalCoordinator {
    var animated: Bool {
        return true
    }

    func start() {
        configure(viewController: viewController)
        sourceController?.present(navigationController, animated: animated, completion: nil)
    }

    func stop() {
        viewController.dismiss(animated: animated, completion: nil)
    }
}

// MARK: - Push Coordinator

protocol PushCoordinator: Coordinator {
    var navigationController: UINavigationController? { get }
    var animated: Bool { get }
}

extension PushCoordinator {
    var animated: Bool {
        return true
    }

    func start() {
        configure(viewController: viewController)
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func stop() {
        navigationController?.popViewController(animated: animated)
    }
}

// MARK: - TabBar Item Coordinator

protocol TabBarItemCoordinator: Coordinator {
    var tabBarController: UITabBarController? { get }
}

extension TabBarItemCoordinator {
    func start() {
        configure(viewController: viewController)

        var viewControllers = tabBarController?.viewControllers ?? []

        if let navigationController = viewController.navigationController {
            viewControllers.append(navigationController)
        } else {
            viewControllers.append(viewController)
        }

        tabBarController?.viewControllers = viewControllers
    }

    func stop() {
        guard let index = tabBarController?.viewControllers?.index(of: viewController.navigationController ?? viewController) else {
            return
        }
        tabBarController?.viewControllers?.remove(at: index)
    }
}

