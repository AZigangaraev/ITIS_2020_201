//
//  UsersDataService.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation

enum UsersDataError: Error {
    case userNotFound
    case purseNotFound
}

class UsersDataService {
    var users: [User] = [
        User(name: "Rustem", FirstName: "Saifullin", password: "rust", purse: [Purse(cryp: Cryp(name: "DOGE", price: "0.01"), quality: 100), Purse(cryp: Cryp(name: "DOGE", price: "0.01"), quality: 100)])
    ]

    func authorization(name1: String, password: String) -> Bool {
        for i in users{
            if (i.name == name1)&&(i.password == password){
                return true
            }
        }
        return false
    }
    
    func getPurse(completion: @escaping (Result<[Purse], Error>) -> Void) {
        guard let name1: String = UserDefaults.standard.value(forKey: "name") as? String else {
            return completion(.failure(UsersDataError.purseNotFound))
        }
        for i in users{
            if (i.name == name1){
                return completion(.success(i.purse))
            }
        }
        return completion(.failure(UsersDataError.purseNotFound))
    }
    
    func addPurse(cryp: Cryp, quality: Int ,completion: @escaping (Result<(), Error>) -> Void) {
        guard let name1: String = UserDefaults.standard.value(forKey: "name") as? String else {
            return completion(.failure(UsersDataError.purseNotFound))
        }
        var j = 0
        for i in users{
            if (i.name == name1){
                users[j].purse.append(Purse(cryp: cryp, quality: quality))
                return completion(.success(()))
            }
            j = j + 1
        }
        return completion(.failure(UsersDataError.purseNotFound))
    }

}
