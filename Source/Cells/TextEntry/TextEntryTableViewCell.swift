//
//  TextEntryTableViewCell.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 29/6/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import HelperKit

public class TextEntryTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet var textField: UITextField!

    // MARK: - Properties

    private var viewModel: TextEntryTableViewCellViewModel?

    // MARK: - UITableViewCell

    override public func prepareForReuse() {
        textField.text = nil
        textField.placeholder = nil
    }

    public func configure(with viewModel: TextEntryTableViewCellViewModel) {
        self.viewModel = viewModel
        configureTextField()
        configureCell()
    }

    // MARK: - TextEntryTableViewCell

    private func configureCell() {
        selectionStyle = .none
    }

    private func configureTextField() {
        guard let viewModel = viewModel else { return }
        textField.placeholder = viewModel.placeholder
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 17.0)
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            textField.becomeFirstResponder()
        }
    }
}

extension TextEntryTableViewCell: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        viewModel?.update(text: text)
    }
}

extension TextEntryTableViewCell: Reusable {}
