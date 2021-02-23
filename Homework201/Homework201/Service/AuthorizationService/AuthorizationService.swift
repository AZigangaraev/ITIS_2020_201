//
//  AuthorizationService.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

enum AuthorizationError: Error {
    case noSuchEmail
    case wrongPassword
}

protocol AuthorizationService {
    func authorize(email: String, password: String, completion: @escaping (Result<User, AuthorizationError>) -> Void)
}
