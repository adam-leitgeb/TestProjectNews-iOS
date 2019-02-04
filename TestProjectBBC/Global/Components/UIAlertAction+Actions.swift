//
//  UIAlertAction+Actions.swift
//  AKit
//
//  Created by Adam Leitgeb on 18/01/2019.
//

import UIKit

public extension UIAlertAction {
    class var closeAction: UIAlertAction {
        return UIAlertAction(
            title: NSLocalizedString("alert.action.close", comment: "Close"),
            style: .cancel,
            handler: nil
        )
    }
}

public extension UIAlertAction {
    class func removeAction(_ handler: @escaping () -> Void) -> UIAlertAction {
        return UIAlertAction(
            title: NSLocalizedString("alert.action.remove", comment: "Remove"),
            style: .destructive,
            handler: { _ in handler() }
        )
    }

    class func logoutAction(_ handler: @escaping () -> Void) -> UIAlertAction {
        return UIAlertAction(
            title: NSLocalizedString("alert.action.logout", comment: "Logout"),
            style: .destructive,
            handler:  { _ in handler() }
        )
    }
}
