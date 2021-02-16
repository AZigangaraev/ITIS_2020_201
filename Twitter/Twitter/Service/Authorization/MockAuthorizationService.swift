//
//  MockAuthorizationService.swift
//  Twitter
//
//  Created by Teacher on 16.02.2021.
//

import Foundation

class MockAuthorizationService: AuthorizationService {
    func authorize(username: String, password: String, completion: @escaping (Result<(), Error>) -> Void) {
        guard username == "admin" && password == "qwerty" else {
            return completion(.failure(AuthorizationError.wrongPassword))
        }

        completion(.success(()))
    }
}
