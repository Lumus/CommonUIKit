//
//  SelectionTableViewCellViewModel.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import Foundation

public class SelectionTableViewCellViewModel: CellViewModel {

    let model: SelectionFormCell

    var title: String { return model.unselectedTitle ?? "Select..." }
    var shouldShowInfo: Bool { return model.hasInfo ?? false }
    var shouldShowDisclosure: Bool { return model.hasDisclosure ?? false }

    public init(model: SelectionFormCell) {
        self.model = model
    }
}
