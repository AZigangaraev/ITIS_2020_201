//
//  CryptoViewModel.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation





protocol CryptoViewModel {
    var cryps: (([Cryp]) -> Void)? { get set }

    func loadData()
}

class CryptoViewModelImplementation: CryptoViewModel {
    private let CryptoService: CryptoDataService = CryptoDataService()
    private var cachedCrypto: [Cryp] = []
    var cryps: (([Cryp]) -> Void)?

    func loadData() {
        cachedCrypto = CryptoService.crypts
        cryps?(cachedCrypto)
    }

    private func updateTweets() {
        cachedCrypto = CryptoService.crypts
        cryps?(cachedCrypto)
    }
}
