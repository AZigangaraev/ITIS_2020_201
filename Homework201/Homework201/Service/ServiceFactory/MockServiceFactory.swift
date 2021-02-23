//
//  MockServiceFactory.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockServiceFactory: ServiceFactory {
    func makeBooksDataService() -> BooksDataService {
        MockBooksDataService()
    }
    
    func makeUserService() -> UserService {
        MockUserService()
    }
    
    func makeAuthorizationService() -> AuthorizationService {
        MockAuthorizationService()
    }
}
