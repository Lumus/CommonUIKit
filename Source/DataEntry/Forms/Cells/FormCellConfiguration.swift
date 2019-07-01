//
//  FormCellConfiguration.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public class FormCellConfiguration: Decodable {

    public let cellType: FormCell?
    public let title: String?

    private enum CodingKeys: String, CodingKey {
        case cellType, title
    }

    public required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)

        title = try keyedContainer.decodeIfPresent(String.self, forKey: .title)
        cellType = try FormCell.decodeIfPresent(usingDecoder: decoder, forKey: CodingKeys.cellType)
    }
}
