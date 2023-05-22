//
//  APIError.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import Foundation

enum APIError: Error {
    case pathURLUndefined(path: String)
}
