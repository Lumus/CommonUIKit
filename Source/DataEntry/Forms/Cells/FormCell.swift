//
//  FormCell.swift
//  NewRyoko
//
//  Created by Matt Croxson on 1/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

public enum FormCellType: String {
    case textEntry
    case selection

    public func decodeActionModelInContainer(_ container: inout UnkeyedDecodingContainer) -> FormCell? {
        do {
            switch self {
            case .textEntry: return try container.decode(TextEntryFormCell.self)
            case .selection: return try container.decode(SelectionFormCell.self)
            }
        } catch {
            assertionFailure(error.localizedDescription)
            return nil
        }
    }

    public var reusableType: Reusable.Type {
        switch self {
        case .textEntry: return TextEntryTableViewCell.self
        case .selection: return SelectionTableViewCell.self
        }
    }
}


public class FormCell: Decodable {

    public let cellType: String?

    private enum CodingKeys: String, CodingKey {
        case cellType
    }

    required public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)

        cellType = try keyedContainer.decodeIfPresent(String.self, forKey: .cellType)
    }

    public static func decode<T: CodingKey>(usingDecoder decoder: Decoder, forKey key: T) throws -> FormCell {
        let container = try decoder.container(keyedBy: T.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: key)

        guard let rawValue = try nestedContainer.decodeIfPresent(String.self, forKey: .cellType),
            let type = FormCellType(rawValue: rawValue)
            else {
                return try container.decode(FormCell.self, forKey: key)
        }

        switch type {
        case .selection: return try container.decode(SelectionFormCell.self, forKey: key)
        case .textEntry: return try container.decode(TextEntryFormCell.self, forKey: key)
        }
    }

    public static func decodeIfPresent<T: CodingKey>(usingDecoder decoder: Decoder, forKey key: T) throws -> FormCell? {
        let container = try decoder.container(keyedBy: T.self)
        if container.contains(key) {
            return try decode(usingDecoder: decoder, forKey: key)
        } else {
            return nil
        }
    }

    public static func decodeArray<T: CodingKey>(usingDecoder decoder: Decoder, forKey key: T) throws -> [FormCell] {
        let container = try decoder.container(keyedBy: T.self)
        var actionModels: [FormCell] = []
        var actionsContainer = try container.nestedUnkeyedContainer(forKey: key)

        // Make a copy of `actionsContainer`. This is needed as we will be iterating the `actionsContainer`. In doing so, we will have no way to get the decoder object for each element in the array if we don't make a copy.
        var actionsContainerCopy = actionsContainer
        while actionsContainer.isAtEnd == false {
            guard let nestedContainer = try? actionsContainer.nestedContainer(keyedBy: CodingKeys.self) else { return actionModels }

            guard let rawValue = try nestedContainer.decodeIfPresent(String.self, forKey: .cellType),
                let actionType = FormCellType(rawValue: rawValue),
                let actionModel = actionType.decodeActionModelInContainer(&actionsContainerCopy)
                else {
                    actionModels.append(try actionsContainerCopy.decode(FormCell.self))
                    continue
            }

            actionModels.append(actionModel)
        }
        return actionModels
    }
}
