//
//  FormViewModelling.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 7/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import HelperKit

public protocol FormViewModelling: ViewModelling {

    // MARK: - Properties

    var numberOfSections: Int { get }
    var title: String? { get }
    var cellTypes: [ReusableView.Type] { get }

    // MARK: - Functions

    func numberOfRows(in section: Int) -> Int
    func cellType(at indexPath: IndexPath) -> ReusableView.Type?
    func cellViewModel(for indexPath: IndexPath) -> FormCellViewModelling?
    func sectionHeading(for section: Int) -> String?
    func sectionFooter(for section: Int) -> String?
    func didSelectRow(at indexPath: IndexPath, completion: (FlowCoordinatorActionable) -> Void)
}
