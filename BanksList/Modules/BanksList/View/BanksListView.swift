//
//  BanksListView.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation
import UIKit

class BanksListView: UIViewController {

    // MARK: - UI Variables

    private var tableView = UITableView()
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        setupViews()
        setupConstraints()
        setupNavigationController()
    }
    
    // MARK: - Properties

    var presenter: BanksListPresenterProtocol?
}

// MARK: - Setup

extension BanksListView {

    private func setupViews() {
        setupView()
        setupTableView()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BankTableViewCell.self, forCellReuseIdentifier: BankTableViewCell.identifier)

        tableView.dataSource = self

        self.view.addSubview(tableView)
    }

    private func setupView() {
        self.view.backgroundColor = .white
    }

    private func setupConstraints() {
        // tableView
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func setupNavigationController() {
        self.navigationItem.title = Strings.banks
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - BanksListViewProtocol

extension BanksListView: BanksListViewProtocol {

    func updateTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func showErrorMessage() {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: Strings.error, message: Strings.errorDesc, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Strings.ok, style: .default, handler: nil))
            self?.present(alert, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension BanksListView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getConfigFiles().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: BankTableViewCell.identifier,
                                                     for: indexPath) as? BankTableViewCell
        else { fatalError("\(BankTableViewCell.identifier) cell not found ") }
        
        if let configFiles = presenter?.getConfigFiles() {
            let configFile = configFiles[indexPath.row]
            cell.configure(configFile)
        }

        return cell
    }
}
