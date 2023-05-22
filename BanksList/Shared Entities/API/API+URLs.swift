//
//  API+URLs.swift
//  BanksList
//
//  Created by Ezequiel Barreto on 22/05/23.
//

import Foundation

struct BankListAPI {
    static var baseURL = "https://dev.obtenmas.com/catom/api"

    static func getURL(path: String) throws -> URL {
        let urlString = BankListAPI.baseURL + path
        
        guard
            let url = URL(string: urlString)
        else { throw APIError.pathURLUndefined(path: path) }

        return url
    }
}
