//
//  TextEntryTableViewCellViewModel.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import HelperKit

public class TextEntryTableViewCellViewModel: FormCellViewModelling {

    // MARK: - Properties

    private let model: TextEntryFormCellConfiguration
    private let textEntryUpdateHandler: TextEntryUpdateHandler
    var placeholder: String? { return model.placeholder }

    // MARK: - TextEntryTableViewCellViewModel

    public init(model: TextEntryFormCellConfiguration,
                textEntryUpdateHandler: @escaping TextEntryUpdateHandler) {
        self.model = model
        self.textEntryUpdateHandler = textEntryUpdateHandler
    }

    func update(text: String?) {
        textEntryUpdateHandler(text)
    }
}
