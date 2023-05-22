//
//  BanksListLocalDataManager.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation

class BanksListLocalDataManager:BanksListLocalDataManagerInputProtocol {

    func getBanksList() -> [BankModel] {
        let storedObjects = BankStorageService.shared.fetchBankObjects()
        
        return storedObjects.compactMap { try? BankModel($0) }
    }
}
