//
//  UserDataServices.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import Foundation

enum UserDataError: Error {
    case userNotFound
}

class UserDataService {
    var users: [User] = [
        User(username: "admin", status: "I'm BOSS!"),
        User(username: "ruslan", status: "No, Im BOSS!!!"),
        User(username: "sveta", status: ")))"),
        User(username: "aaaaa", status: "AAAAA"),
        User(username: "user", status: "I'm user!"),
    ]
    
    func getUser(by username: String, completion: @escaping (Result<User, UserDataError>) -> Void) {
        if let user = users.first(where: {$0.username == username}) {
            completion(.success(user))
        } else {
            completion(.failure(.userNotFound))
        }
        
    }
}
