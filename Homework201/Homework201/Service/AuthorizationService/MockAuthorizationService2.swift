//
//  MockAuthorizationService2.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockAuthorizationService2: AuthorizationService {
    func authorize(email: String, password: String, completion: @escaping (Result<User, AuthorizationError>) -> Void) {
        guard email == "admin@bs.com" else {
            return completion(.failure(.noSuchEmail))
        }
        guard password == "123" else {
            return completion(.failure(.wrongPassword))
        }
        completion(.success(User(id: 1, email: "admin@bs.com", password: "123")))
    }
}
