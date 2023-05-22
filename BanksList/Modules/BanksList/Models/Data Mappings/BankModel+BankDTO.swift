//
//  BankModel+BankDTO.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import Foundation

extension BankModel {

    // MARK: - Initialization

    init(_ dto: BankDTO) throws {
        guard
            let imageURL = URL(string: dto.url)
        else { throw BankModelError.bankImageURLUndefined(bankName: dto.bankName) }

        self.init(bankName: dto.bankName,
                  description: dto.description,
                  age: dto.age,
                  imageURL: imageURL)
    }
}
