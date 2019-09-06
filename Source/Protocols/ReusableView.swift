//
//  ReusableView.swift
//  HelperKit
//
//  Created by Matt Croxson on 22/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

/// Helpers for reusable views.
public protocol ReusableView: NibCreatable {}

public extension ReusableView {
    static var reuseIdentifier: String {
         return nibName
    }
}
