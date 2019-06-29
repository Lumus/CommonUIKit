//
//  ContainerView.swift
//  NewRyoko
//
//  Created by Matt Croxson on 20/5/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import UIKit

public class ContainerView: UIVisualEffectView {
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        let radius = min(bounds.height, bounds.width) / 2.0
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
