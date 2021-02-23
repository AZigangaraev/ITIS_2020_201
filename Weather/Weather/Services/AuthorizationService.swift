//
//  AuthorizationService.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import Foundation

enum AuthorizationError: Error {
    case wrongPassword
}

class AuthorizationService {
    func authorize(username: String, password: String, completion: @escaping (Result<(), Error>) -> Void) {
        guard username == "admin" && password == "123456" else {
            return completion(.failure(AuthorizationError.wrongPassword))
        }
        
        completion(.success(()))
    }
        
    
}
