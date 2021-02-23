//
//  PurseViewModel.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation

protocol PurseViewModel {
    var purses: (([Purse]) -> Void)? { get set }

    func loadData()
}

class PurseViewModelImplementation: PurseViewModel {
    private let usersService: UsersDataService = UsersDataService()
    private var cachedPurse: [Purse] = []
    var purses: (([Purse]) -> Void)?

    func loadData() {
        cachedPurse = []
        usersService.getPurse(){
            result in
            switch result {
            case .success(let result):
                self.cachedPurse = result
            case .failure(let error):
                print("Could not : \(error)")
        }
        }
        purses?(cachedPurse)
    }

    private func updatePurse() {
        cachedPurse = []
        usersService.getPurse(){
            result in
            switch result {
            case .success(let result):
                self.cachedPurse = result
            case .failure(let error):
                print("Could not : \(error)")
        }
        }
        purses?(cachedPurse)
    }
}
