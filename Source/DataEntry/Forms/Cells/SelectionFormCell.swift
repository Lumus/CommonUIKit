//
//  SelectionFormCell.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public class SelectionFormCell: FormCell {

    public let title: String?
    public let hasInfo: Bool?
    public let hasDisclosure: Bool?

    private enum CodingKeys: String, CodingKey {
        case title
        case hasInfo
        case hasDisclosure
    }

    required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try keyedContainer.decodeIfPresent(String.self, forKey: .title)
        self.hasInfo = try keyedContainer.decodeIfPresent(Bool.self, forKey: .hasInfo)
        self.hasDisclosure = try keyedContainer.decodeIfPresent(Bool.self, forKey: .hasDisclosure)
        try super.init(from: decoder)
    }
}
