//
//  BanksListRouter.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation
import UIKit

class BanksListRouter: BanksListRouterProtocol {

    class func createBanksListModule() -> UIViewController {

        let view: BanksListView = BanksListView()
        let presenter: BanksListPresenterProtocol & BanksListInteractorOutputProtocol = BanksListPresenter()
        let interactor: BanksListInteractorInputProtocol & BanksListRemoteDataManagerOutputProtocol = BanksListInteractor()
        let localDataManager: BanksListLocalDataManagerInputProtocol = BanksListLocalDataManager()
        let remoteDataManager: BanksListRemoteDataManagerInputProtocol = BanksListRemoteDataManager()
        let router: BanksListRouterProtocol = BanksListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        router.view = view
        
        return view
    }
    
    weak var view: BanksListView?
}
