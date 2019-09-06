//
//  ReusableAnnotation.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 6/9/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

// Helpers for reusable annotations
public protocol ReusableAnnotation where Self: UIView { }

public extension ReusableAnnotation {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
