//
//  BanksListRemoteDataManager.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//  
//

import Foundation

class BanksListRemoteDataManager:BanksListRemoteDataManagerInputProtocol {

    func getBanksList() {
        do {
            let url = try BankListAPI.getURL(path: "/challenge/banks")

            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data {
                    let banksListDTO = try? JSONDecoder().decode([BankDTO].self, from: data)
                    let banksList: [BankModel] = banksListDTO?.compactMap { try? BankModel($0) } ?? []
                    
                    BankStorageService.shared.saveBankList(banksListDTO ?? [])
                    self?.remoteRequestHandler?.onGetBanksList(banksList)
                } else if error != nil {
                    self?.remoteRequestHandler?.onGetBanksListError()
                }
            }

            task.resume()
        } catch {
            remoteRequestHandler?.onGetBanksListError()
        }
    }

    var remoteRequestHandler: BanksListRemoteDataManagerOutputProtocol?
}
