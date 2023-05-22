//
//  BanksListProtocols.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation
import UIKit

protocol BanksListViewProtocol: AnyObject {
    func updateTableView()
    func showErrorMessage()

    var presenter: BanksListPresenterProtocol? { get set }
}

protocol BanksListInteractorInputProtocol: AnyObject {
    func getBanksList()

    var presenter: BanksListInteractorOutputProtocol? { get set }
    var localDatamanager: BanksListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: BanksListRemoteDataManagerInputProtocol? { get set }
}

protocol BanksListInteractorOutputProtocol: AnyObject {
    func onGetBanksList(_ list: [BankModel])
    func onGetBanksListError()
}

protocol BanksListRemoteDataManagerInputProtocol: AnyObject {
    func getBanksList()
    
    var remoteRequestHandler: BanksListRemoteDataManagerOutputProtocol? { get set }
}

protocol BanksListRemoteDataManagerOutputProtocol: AnyObject {
    func onGetBanksList(_ list: [BankModel])
    func onGetBanksListError()
}

protocol BanksListLocalDataManagerInputProtocol: AnyObject {
    func getBanksList() -> [BankModel]
}

protocol BanksListPresenterProtocol: AnyObject {
    func getConfigFiles() -> [BankTableViewConfigFile]

    func viewDidLoad()

    var view: BanksListViewProtocol? { get set }
    var interactor: BanksListInteractorInputProtocol? { get set }
    var router: BanksListRouterProtocol? { get set }
}

protocol BanksListRouterProtocol: AnyObject {
    static func createBanksListModule() -> UIViewController

    var view: BanksListView? { get set }
}
