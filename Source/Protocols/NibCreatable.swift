//
//  NibCreatable.swift
//  HelperKit
//
//  Created by Matt Croxson on 22/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit.UIView

/// Helpers for creating views from Nibs.
public protocol NibCreatable where Self: UIView {}

public extension NibCreatable {

    /// Returns a Nib for the class
    /// - Important: The `Nib` and `Class` files **must** be identically named.
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: nibName, bundle: bundle)
    }

    /// Returns the Nib name of the class.
    /// - Important: The `Nib` and `Class` files **must** be identically named.
    static var nibName: String {
        return String(describing: Self.self)
    }

    /// Intantiates a Nib for the class.
    ///
    /// - Returns: Nib-instantiated class
    /// - Important: The `Nib` and `Class` files **must** be identically named.
    static func create() -> Self {
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? Self else {
            preconditionFailure("Unable to load \(nibName) from nib. Did you set the nib class correctly?")
        }
        return view
    }
}
