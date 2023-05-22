//
//  BankModel.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import Foundation

struct BankModel {
    var bankName: String
    var description: String
    var age: Int
    var imageURL: URL

    func mapToConfigFile() -> BankTableViewConfigFile {
        BankTableViewConfigFile(title: self.bankName,
                                description: self.description,
                                extraInfo: String(self.age) + " " + Strings.years,
                                cellImageURL: self.imageURL)
    }
}
