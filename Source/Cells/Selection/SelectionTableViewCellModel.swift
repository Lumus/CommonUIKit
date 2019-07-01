//
//  SelectionTableViewCellModel.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public struct SelectionTableViewCellModel {
    let title: String?
    let shouldShowInfo: Bool
    let shouldShowDisclosure: Bool


    public init(title: String?,
                shouldShowInfo: Bool,
                shouldShowDisclosure: Bool) {
        self.title = title
        self.shouldShowInfo = shouldShowInfo
        self.shouldShowDisclosure = shouldShowDisclosure
    }
}
