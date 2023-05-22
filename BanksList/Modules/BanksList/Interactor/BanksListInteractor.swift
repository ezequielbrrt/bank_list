//
//  BanksListInteractor.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation

final class BanksListInteractor: BanksListInteractorInputProtocol {

    func getBanksList() {
        guard
            let objects = localDatamanager?.getBanksList()
        else {
            remoteDatamanager?.getBanksList()
            return
        }

        objects.count > 0
            ? presenter?.onGetBanksList(objects)
            : remoteDatamanager?.getBanksList()
    }

    // MARK: - Properties

    weak var presenter: BanksListInteractorOutputProtocol?
    var localDatamanager: BanksListLocalDataManagerInputProtocol?
    var remoteDatamanager: BanksListRemoteDataManagerInputProtocol?
}

// MARK: - BanksListRemoteDataManagerOutputProtocol

extension BanksListInteractor: BanksListRemoteDataManagerOutputProtocol {

    func onGetBanksList(_ list: [BankModel]) {
        presenter?.onGetBanksList(list)
    }

    func onGetBanksListError() {
        presenter?.onGetBanksListError()
    }
}
