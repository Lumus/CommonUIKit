//
//  SelectionTableViewCellViewModel.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public class SelectionTableViewCellViewModel {

    var title: String { return model.title ?? "No Title" }
    let model: SelectionTableViewCellModel

    var shouldShowInfo: Bool { return model.shouldShowInfo }
    var shouldShowDisclosure: Bool { return model.shouldShowDisclosure }

    public init(model: SelectionTableViewCellModel) {
        self.model = model
    }
}
