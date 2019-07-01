//
//  FormSectionConfiguration.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public class FormSectionConfiguration: Decodable {

    public let headerTitle: String?
    public let footerTitle: String?
    public let cells: [FormCell]?

    private enum CodingKeys: String, CodingKey {
        case headerTitle, footerTitle, cells
    }

    public required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        headerTitle = try keyedContainer.decodeIfPresent(String.self, forKey: .headerTitle)
        footerTitle = try keyedContainer.decodeIfPresent(String.self, forKey: .footerTitle)
        cells = try keyedContainer.decodeIfPresent([FormCell].self, forKey: .cells)
    }
}

extension FormSectionConfiguration: Equatable {
    public static func == (lhs: FormSectionConfiguration, rhs: FormSectionConfiguration) -> Bool {
        return lhs.headerTitle == rhs.headerTitle &&
            rhs.footerTitle == rhs.footerTitle &&
            rhs.cells == lhs.cells
    }
}
