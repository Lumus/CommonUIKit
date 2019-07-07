//
//  FormViewController.swift
//  CommonUIKit
//
//  Created by Matt Croxson on 7/7/19.
//  Copyright © 2019 Matt Croxson. All rights reserved.
//

import HelperKit

open class FormViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Properties

    private var flowCoordiantor: FlowCoordinator!
    private var viewModel: FormViewModelling!

    public static func instantiate(viewModel: FormViewModelling,
                            flowCoordinator: FlowCoordinator) -> FormViewController {
        let viewController = FormViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.flowCoordiantor = flowCoordinator
        return viewController
    }

    // MARK: - UIViewController

    open override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // MARK: - Form View Controller

    private func configure() {
        configureTableView()
        title = viewModel.title
    }

    private func configureTableView() {
        configureTableViewDelegate()
        configureTableViewDataSource()
    }
}

// MARK: - UITableViewDelegate

extension FormViewController: UITableViewDelegate {
    private func configureTableViewDelegate() {
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension FormViewController: UITableViewDataSource {
    private func configureTableViewDataSource() {
        tableView.dataSource = self
        tableView.register(viewModel.cellTypes)
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cellType = viewModel.cellType(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath)

        switch cell {
        case let cell as TextEntryTableViewCell: configureTextEntryCell(cell, at: indexPath)
        case let cell as SelectionTableViewCell: configureSelectionCell(cell, at: indexPath)

        default: break
        }

        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionHeading(for: section)
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return viewModel.sectionFooter(for: section)
    }

    private func configureTextEntryCell(_ cell: TextEntryTableViewCell, at indexPath: IndexPath) {
        guard let cellViewModel = viewModel.cellViewModel(at: indexPath) as? TextEntryTableViewCellViewModel else { return }
        cell.configure(with: cellViewModel)
    }

    private func configureSelectionCell(_ cell: SelectionTableViewCell, at indexPath: IndexPath) {
        guard let cellViewModel = viewModel.cellViewModel(at: indexPath) as? SelectionTableViewCellViewModel else { return }
        cell.configure(with: cellViewModel)
    }
}

// MARK: - Storyboarded

extension FormViewController: Storyboarded {}
