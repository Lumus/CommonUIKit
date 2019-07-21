//
//  Storyboarded.swift
//  NewRyoko
//
//  Created by Matt Croxson on 16/5/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit

public protocol Storyboarded where Self: UIViewController {
    static func instantiate() -> Self
}

public extension Storyboarded where Self: UIViewController {
    private static var bundle: Bundle? {
        return Bundle(for: Self.self)
    }

    private static var storyboardName: String {
        return String(describing: self)
    }

    private static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }

    static func instantiate() -> Self {
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Unable to instantiate storyboard \"\(storyboardName)\". Did you forget to set the initial view controller checkbox?")
        }
        return viewController
    }
}
