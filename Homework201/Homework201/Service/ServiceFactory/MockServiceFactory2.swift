//
//  MockServiceFactory2.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockServiceFactory2: ServiceFactory {
    func makeBooksDataService() -> BooksDataService {
        MockBooksDataService2()
    }
    
    func makeUserService() -> UserService {
        MockUserService2()
    }
    
    func makeAuthorizationService() -> AuthorizationService {
        MockAuthorizationService2()
    }
}
