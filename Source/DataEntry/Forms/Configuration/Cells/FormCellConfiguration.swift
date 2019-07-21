//
//  FormCellConfiguration.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public enum FormCellType: String {
    case textEntry
    case selection

    public func decodeActionModelInContainer(_ container: inout UnkeyedDecodingContainer) -> FormCellConfiguration? {
        do {
            switch self {
            case .textEntry: return try container.decode(TextEntryFormCellConfiguration.self)
            case .selection: return try container.decode(SelectionFormCellConfiguration.self)
            }
        } catch {
            assertionFailure(error.localizedDescription)
            return nil
        }
    }
}

public class FormCellConfiguration: Decodable {

    public let cellType: String?

    private enum CodingKeys: String, CodingKey {
        case cellType
    }

    required public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)

        cellType = try keyedContainer.decodeIfPresent(String.self, forKey: .cellType)
    }

    public static func decode<T: CodingKey>(usingDecoder decoder: Decoder,
                                            forKey key: T) throws -> FormCellConfiguration {
        let container = try decoder.container(keyedBy: T.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: key)

        guard let rawValue = try nestedContainer.decodeIfPresent(String.self, forKey: .cellType),
            let type = FormCellType(rawValue: rawValue)
            else {
                return try container.decode(FormCellConfiguration.self, forKey: key)
        }

        switch type {
        case .selection: return try container.decode(SelectionFormCellConfiguration.self, forKey: key)
        case .textEntry: return try container.decode(TextEntryFormCellConfiguration.self, forKey: key)
        }
    }

    public static func decodeIfPresent<T: CodingKey>(usingDecoder decoder: Decoder,
                                                     forKey key: T) throws -> FormCellConfiguration? {
        let container = try decoder.container(keyedBy: T.self)
        if container.contains(key) {
            return try decode(usingDecoder: decoder, forKey: key)
        } else {
            return nil
        }
    }

    public static func decodeArray<T: CodingKey>(usingDecoder decoder: Decoder,
                                                 forKey key: T) throws -> [FormCellConfiguration] {
        let container = try decoder.container(keyedBy: T.self)
        var actionModels: [FormCellConfiguration] = []
        var actionsContainer = try container.nestedUnkeyedContainer(forKey: key)

        // Make a copy of `actionsContainer`. This is needed as we will be iterating the `actionsContainer`. In doing
        // so, we will have no way to get the decoder object for each element in the array if we don't make a copy.
        var actionsContainerCopy = actionsContainer
        while actionsContainer.isAtEnd == false {
            guard let nestedContainer = try? actionsContainer.nestedContainer(keyedBy: CodingKeys.self) else {
                return actionModels
            }

            guard let rawValue = try nestedContainer.decodeIfPresent(String.self, forKey: .cellType),
                let actionType = FormCellType(rawValue: rawValue),
                let actionModel = actionType.decodeActionModelInContainer(&actionsContainerCopy)
                else {
                    actionModels.append(try actionsContainerCopy.decode(FormCellConfiguration.self))
                    continue
            }

            actionModels.append(actionModel)
        }
        return actionModels
    }

    public var reusableType: Reusable.Type? {
        guard let cellType = cellType,
            let cellTypeEnum = FormCellType(rawValue: cellType) else { return nil }
        switch cellTypeEnum {
        case .textEntry: return TextEntryTableViewCell.self
        case .selection: return SelectionTableViewCell.self
        }
    }
}

extension FormCellConfiguration: Equatable {
    public static func == (lhs: FormCellConfiguration, rhs: FormCellConfiguration) -> Bool {
        return lhs.cellType == rhs.cellType
    }
}
