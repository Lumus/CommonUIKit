//
//  UITableView+ReusableView.swift
//  HelperKit
//
//  Created by Matt Croxson on 22/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit.UITableView

public extension UITableView {

    /// Registers a `ReusableView` view with the table view.
    ///
    /// - Parameter reusableType: View type to be registered.
    func register(_ reusableType: ReusableView.Type?) {
        guard let reusableType = reusableType else { return }
        self.register(reusableType.nib,
                      forCellReuseIdentifier: reusableType.reuseIdentifier)
    }

    /// Registers an array of `ReusableView` views with the table view.
    /// - Parameter reusableTypes: Array of view types to be registered.
    func register(_ reusableTypes: [ReusableView.Type]?) {
        reusableTypes?.forEach { reusableType in
            self.register(reusableType)
        }
    }

    /// Dequeues a cell with the provided `ReusableView` type and index path.
    ///
    /// - Parameters:
    ///   - reusable: `ReusableView` type to dequeue.
    ///   - indexPath: Index path of the cell being dequeued.
    /// - Returns: `ReusableView` cell, or nil if the dequeue process fails.
    func dequeueReusableCell(_ reusable: ReusableView.Type,
                             for indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: reusable.reuseIdentifier, for: indexPath)
        return cell
    }
}
