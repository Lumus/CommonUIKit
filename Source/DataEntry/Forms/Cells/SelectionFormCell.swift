//
//  SelectionFormCell.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public class SelectionFormCell: FormCell {

    public let title: String?

    private enum CodingKeys: String, CodingKey {
        case title
    }

    required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try keyedContainer.decodeIfPresent(String.self, forKey: .title)
        try super.init(from: decoder)
    }
}
