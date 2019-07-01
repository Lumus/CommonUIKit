//
//  TextEntryFormCell.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public class TextEntryFormCell: FormCell {

    public let placeholder: String?

    private enum CodingKeys: String, CodingKey {
        case placeholder
    }

    public required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.placeholder = try keyedContainer.decodeIfPresent(String.self, forKey: .placeholder)
        try super.init(from: decoder)
    }
}
