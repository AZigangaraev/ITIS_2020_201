//
//  File.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import Foundation

class HardCodeRegistationService: RegistrationService {
    
    func saveData(username: String, password: String) {
        var dictionary = UserDefaults.standard.dictionary(forKey: BooksUserDefaults.dictionaryKey) as? [String: String] ?? [:]
        if username != "" && password != "" {
            dictionary[username] = password
            UserDefaults.standard.setValue(dictionary, forKey: BooksUserDefaults.dictionaryKey)
        }
    }
    
}
