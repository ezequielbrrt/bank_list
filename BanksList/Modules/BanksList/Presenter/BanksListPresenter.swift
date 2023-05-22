//
//  BanksListPresenter.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation

class BanksListPresenter: BanksListPresenterProtocol  {

    func viewDidLoad() {
        interactor?.getBanksList()
    }

    func getConfigFiles() -> [BankTableViewConfigFile] {
        configFiles
    }

    // MARK: - Properties

    weak var view: BanksListViewProtocol?
    var interactor: BanksListInteractorInputProtocol?
    var router: BanksListRouterProtocol?

    // MARK: - Private Propeties

    private var configFiles: [BankTableViewConfigFile] = []
}

// MARK: - BanksListInteractorOutputProtocol

extension BanksListPresenter: BanksListInteractorOutputProtocol {

    func onGetBanksList(_ list: [BankModel]) {
        self.configFiles = list.map { $0.mapToConfigFile() }
        view?.updateTableView()
    }

    func onGetBanksListError() {
        view?.showErrorMessage()
    }
}
