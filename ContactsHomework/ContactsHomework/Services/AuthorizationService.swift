//
//  AuthorizationService.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import Foundation
enum AuthorizationError: Error {
    case wrongUsernameOrPassword
    case wrongCode
}

class AuthorizationService {
    func authorize(username: String, password: String, completion: @escaping (Result<(), AuthorizationError>) -> Void) {
        guard username == "admin" && password == "admin" else {
            return completion(.failure(.wrongUsernameOrPassword))
        }
        completion(.success(()))
    }
    
    func checkCode(code: String, completion: @escaping (Result<(), AuthorizationError>) -> Void) {
        guard code == "1234" else {
            return completion(.failure(.wrongCode))
        }
        completion(.success(()))
    }
}
