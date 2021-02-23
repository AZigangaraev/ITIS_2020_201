//
//  MockUserService.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockUserService: UserService {
    private static var userBooks: [Int: Set<Int>] = [
        1: [1, 5, 6, 7],
        2: [2, 3, 4]
    ]
    
    func getUserBooks(userId: Int) -> Set<Int> {
        guard let userBooks = MockUserService.userBooks[userId] else {
            return Set<Int>()
        }
        return userBooks
    }
    
    func doesUserHaveBook(userId: Int, bookId: Int) -> Bool {
        return getUserBooks(userId: userId).contains(bookId)
    }
    
    func purchaseBook(userId: Int, bookId: Int, completion: @escaping (Result<(), UserServiceError>) -> Void) {
        guard let _ = MockUserService.userBooks[userId]?.insert(bookId).inserted else {
            return completion(.failure(.bookPurchaseFailed))
        }
        completion(.success(()))
    }
}
