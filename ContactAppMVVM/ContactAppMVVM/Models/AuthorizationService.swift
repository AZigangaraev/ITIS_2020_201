//
//  AuthorizationService.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
//

import Foundation

enum AuthorizationError: Error {
    case wrongPassword
}

class AuthorizationService {
    func authorize(username: String, password: String, completion: @escaping (Result<(), Error>) -> Void) {
        guard username == "admin" && password == "qwerty" else {
            return completion(.failure(AuthorizationError.wrongPassword))
        }

        completion(.success(()))
    }
}
