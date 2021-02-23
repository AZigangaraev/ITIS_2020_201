//
//  ServiceFactory.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

protocol ServiceFactory {
    func makeBooksDataService() -> BooksDataService
    func makeUserService() -> UserService
    func makeAuthorizationService() -> AuthorizationService
}
