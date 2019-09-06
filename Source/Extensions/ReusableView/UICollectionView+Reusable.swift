//
//  UICollectionView+ReusableView.swift
//  HelperKit
//
//  Created by Matt Croxson on 22/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit.UICollectionView

public extension UICollectionView {

    /// Registers the `ReusableView` view with the collection view.
    ///
    /// - Parameter reusable: View to be registered
    func register(_ reusable: ReusableView.Type) {
        self.register(reusable.nib, forCellWithReuseIdentifier: reusable.reuseIdentifier)
    }

    func register(_ reusable: [ReusableView.Type]) {
        reusable.forEach { reusableType in
            self.register(reusableType)
        }
    }

    /// Registers the `Reusable` view with the collection view for creating supplementary views.
    ///
    /// - Parameters:
    ///   - reusable: View to be registered.
    ///   - kind: The kind of supplementary view to create.
    func register(_ reusable: ReusableView.Type, forSupplementaryViewOfKind kind: String) {
        self.register(reusable.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusable.reuseIdentifier)
    }

    /// Dequeues a cell with the provided `Reusable` type and index path.
    ///
    /// - Parameters:
    ///   - reusable: `ReusableView` type to dequeue.
    ///   - indexPath: Index path of the cell to be dequeued.
    /// - Returns: `ReusableView` cell, or nil if the dequeue process fails.
    func dequeueReusableCell(_ reusable: ReusableView.Type, for indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: reusable.reuseIdentifier, for: indexPath)
    }

    /// Dequeues a view with the provided `Reusable` type, kind and index path.
    ///
    /// - Parameters:
    ///   - reusable: `ReusableView` view to be dequeued
    ///   - kind: Kind of supplementary view to dequeue.
    ///   - indexPath: Index path of the view being dequeued.
    /// - Returns: `ReusableView` view, or nil if the dequeue process fails.
    func dequeueReusableSupplementaryView(_ reusable: ReusableView.Type,
                                          ofKind kind: String,
                                          for indexPath: IndexPath) -> UICollectionReusableView {
        return dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: reusable.reuseIdentifier,
                                                for: indexPath)
    }
}
