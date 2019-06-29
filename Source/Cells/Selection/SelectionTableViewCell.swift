//
//  SelectionTableViewCell.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import HelperKit

public class SelectionTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet var titleLabel: UILabel!

    // MARK: - Properties

    private var viewModel: SelectionTableViewCellViewModel?

    public func configure(with viewModel: SelectionTableViewCellViewModel) {
        self.viewModel = viewModel
        configureTitleLabel()
        configureCell()
    }

    private func configureTitleLabel() {
        guard let viewModel = viewModel else { return }
        titleLabel.font = .systemFont(ofSize: 17.0)
        titleLabel.text = viewModel.title
    }

    private func configureCell() {
        accessoryType = .detailDisclosureButton
    }
}

extension SelectionTableViewCell: Reusable {}
