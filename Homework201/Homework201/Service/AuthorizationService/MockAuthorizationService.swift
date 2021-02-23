//
//  MockAuthorizationService.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockAuthorizationService: AuthorizationService {
    private let users = [
        User(id: 1, email: "admin@bookstore.com", password: "qwerty"),
        User(id: 2, email: "johnappleseed@bookstore.com", password: "123456")
    ]
    
    func authorize(email: String, password: String, completion: @escaping (Result<User, AuthorizationError>) -> Void) {
        guard let user = users.first(where: { user in user.email == email }) else {
            return completion(.failure(.noSuchEmail))
        }
        guard user.password == password else {
            return completion(.failure(.wrongPassword))
        }
        
        completion(.success(user))
    }
}
