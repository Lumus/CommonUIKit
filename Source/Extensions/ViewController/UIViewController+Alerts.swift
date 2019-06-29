//
//  UIViewController+CommonUIKit.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit

public extension UIViewController {

    /// Presents a UIAlertController with the provided title, message and an OK button.
    ///
    /// - Parameters:
    ///   - title: Title of the alert.
    ///   - message: Message to display in the alert.
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true,
                          completion: nil)
        }
    }
}
