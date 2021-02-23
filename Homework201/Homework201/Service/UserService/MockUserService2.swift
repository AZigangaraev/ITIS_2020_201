//
//  MockUserService2.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockUserService2: UserService {
    func getUserBooks(userId: Int) -> Set<Int> {
        Set<Int>()
    }
    
    func doesUserHaveBook(userId: Int, bookId: Int) -> Bool {
        false
    }
    
    func purchaseBook(userId: Int, bookId: Int, completion: @escaping (Result<(), UserServiceError>) -> Void) {
        completion(.failure(.bookPurchaseFailed))
    }
}

