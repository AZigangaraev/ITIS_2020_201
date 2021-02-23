//
//  HardCodeAuthService.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import Foundation

class HardCodeAuthService: AuthService {
    func authorize(username: String, password: String, completion: @escaping (Result<(), AuthError>) -> Void) {
        
        let dictionary = UserDefaults.standard.dictionary(forKey: BooksUserDefaults.dictionaryKey) as? [String: String] ?? [:]
        
        if password == dictionary[username] {
            return completion(.success(()))
        } else {
            completion(.failure(AuthError.wrongData))
        }
        
    }
}
