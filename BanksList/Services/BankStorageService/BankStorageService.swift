//
//  BankStorageService.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import CoreData
import Foundation

class BankStorageService {
    
    static let shared = BankStorageService()
    
    // MARK: - Initialization
    
    private init() { }

    // MARK: - Internal Properties

    var modelName = "BankDataModel"

    // MARK: - Internal Methods

    func saveBankList(_ bankList: [BankDTO]) {
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext

        bankList.forEach {
            let newBankEntity = BankEntity(context: managedContext)

            newBankEntity.setValue($0.bankName, forKey: #keyPath(BankEntity.name))
            newBankEntity.setValue($0.description, forKey: #keyPath(BankEntity.bankDescription))
            newBankEntity.setValue($0.age, forKey: #keyPath(BankEntity.age))
            newBankEntity.setValue($0.url, forKey: #keyPath(BankEntity.url))
            
            AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        }
    }

    func fetchBankObjects() -> [BankDTO] {
        let registerFetch: NSFetchRequest<BankEntity> = BankEntity.fetchRequest()
        
        do {
            let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try managedContext.fetch(registerFetch)
            
            let bankDTOList: [BankDTO] = results.compactMap {
                guard
                    let bankName = $0.name,
                    let description = $0.bankDescription,
                    let url = $0.url
                else { return nil }
                
                return BankDTO(bankName: bankName,
                               description: description,
                               age: Int($0.age),
                               url: url)
                
            }
            
            return bankDTOList
        } catch {
            return []
        }
    }
}
