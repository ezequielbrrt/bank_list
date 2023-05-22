//
//  BankDTO.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import Foundation

struct BankDTO: Decodable {
    let bankName: String
    let description: String
    let age: Int
    let url: String
}
