//
//  FormConfiguration.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public class FormConfiguration: Decodable {

    public let title: String?
    public let sections: [FormSectionConfiguration]?

    private enum CodingKeys: String, CodingKey {
        case title, sections
    }

    public required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try keyedContainer.decodeIfPresent(String.self, forKey: .title)
        self.sections = try keyedContainer.decodeIfPresent([FormSectionConfiguration].self, forKey: .sections)
    }

    public var cellTypes: [ReusableView.Type]? {
        guard let sections = sections else { return nil }

        let cells = sections.compactMap({ $0.cells }).reduce([], +).reduce([], { $0.contains($1) ? $0 : $0 + [$1] })
        return cells.compactMap {$0.reusableType}
    }
}
