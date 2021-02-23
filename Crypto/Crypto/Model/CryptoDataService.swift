//
//  CryptoDataService.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation



enum CryptoError: Error {
    case cryptoNotFound
}

class CryptoDataService {
    var crypts: [Cryp] = [
        Cryp(name: "DOGE", price: "0.01"),
        Cryp(name: "LITE", price: "0.4"),
        Cryp(name: "BTC", price: "50K"),
        Cryp(name: "ETH", price: "10K")
    ]

    func getPrice(name: String, completion: @escaping (Result<String, CryptoError>) -> Void) {
        var result  = ""
        for i in crypts {
            if i.name == name {
                result = i.price
            }
            completion(.success(result))
        }
        completion(.failure(.cryptoNotFound))
        
    }

}
