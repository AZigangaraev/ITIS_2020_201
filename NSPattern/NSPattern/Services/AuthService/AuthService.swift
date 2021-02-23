//
//  AuthService.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import Foundation

enum AuthError: Error {
    case wrongData
}

protocol AuthService {
    func authorize(username: String, password: String, completion: @escaping (Result<(), AuthError>) -> Void)
}
