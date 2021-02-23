//
//  AuthorizationService.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation

enum AuthorizationError: Error {
    case wrongPassword
}



class AuthorizationService {
    
    private let usersDataService: UsersDataService = UsersDataService()
    func authorize(username: String, password: String, completion: @escaping (Result<(), Error>) -> Void) {
        print("1")
      
        if usersDataService.authorization(name1: username, password: password) {
            print("2")
            completion(.success(()))
        } else {
            return completion(.failure(AuthorizationError.wrongPassword))
        }

    }
}
