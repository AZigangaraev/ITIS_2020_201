//
//  UserService.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

enum UserServiceError: Error {
    case bookPurchaseFailed
}

protocol UserService {
    func getUserBooks(userId: Int) -> Set<Int>
    func doesUserHaveBook(userId: Int, bookId: Int) -> Bool
    func purchaseBook(userId: Int, bookId: Int, completion: @escaping (Result<(), UserServiceError>) -> Void)
}
