//
//  UIStackView+CommonUIKit.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 26/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public extension UIStackView {
    func clear() {
        arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}
