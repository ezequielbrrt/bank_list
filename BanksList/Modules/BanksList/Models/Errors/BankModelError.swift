//
//  BankModelError.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import Foundation

enum BankModelError: Error {
    case bankImageURLUndefined(bankName: String)
}
