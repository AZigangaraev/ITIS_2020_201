//
//  ServiceFactory.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import Foundation

import Foundation

protocol ServiceFactory {
    func makeBooksDataService() -> BookDataService
    func makeAuthService() -> AuthService
    func makeRegistorService() -> RegistrationService
}


class MyServiceFactory: ServiceFactory {
    func makeBooksDataService() -> BookDataService {
        HardCodeBookDataService()
    }
    
    func makeAuthService() -> AuthService {
        HardCodeAuthService()
    }
    
    func makeRegistorService() -> RegistrationService {
        HardCodeRegistationService()
    }

}
