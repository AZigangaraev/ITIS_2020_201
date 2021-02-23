//
//  AuthCoordinator.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import UIKit

class AuthorizationCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private let serviceFactory: ServiceFactory
    
    init(factoryService: ServiceFactory) {
        serviceFactory = factoryService
    }
    
    func start() -> UIViewController  {
        authorizationController()
    }

    private func authorizationController() -> UIViewController {
        let authViewController: AuthViewController = storyboard.instantiateViewController(identifier: "AuthViewController")
        let authViewModel = HardCodeAuthViewModel()
        authViewModel.authService = serviceFactory.makeAuthService()
        authViewController.authViewModel = authViewModel
        
        let booksTableViewController = BooksTableViewCoordinator(factoryService: serviceFactory).start()
        booksTableViewController.navigationItem.title = "Books"
        
        let regViewController = RegistrationCoordinator(factoryService: serviceFactory).start()
        
        authViewModel.onSuccesAuth = { [weak authViewController] in
            authViewController?.navigationController?.pushViewController(booksTableViewController, animated: true)
        }
        authViewModel.onRegScreen = { [weak authViewController] in
            authViewController?.navigationController?.pushViewController(regViewController, animated: true)
        }
        
        return UINavigationController(rootViewController: authViewController)
    }
}
