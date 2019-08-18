//
//  UIColor+Hex.swift
//  HelperKit
//
//  Created by Matt Croxson on 22/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit.UIColor

public extension UIColor {

    /// Initialises a colour with the provided hex string.
    ///
    /// - Parameter hex: Hex string for the colour being decoded.
    convenience init?(hex: String?) {
        guard let hex = hex else { return nil }
        let red, green, blue, alpha: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: red,
                              green: green,
                              blue: blue,
                              alpha: alpha)
                    return
                }
            }
        }

        return nil
    }
}
