//
//  AuthCoordinator.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import UIKit

class AuthorizationCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func start() -> UIViewController  {
        authorizationController()
    }

    private func authorizationController() -> UIViewController {
        let authViewController: AuthViewController = storyboard.instantiateViewController(identifier: "AuthViewController")
        let authViewModel = HardCodeAuthViewModel()
        authViewModel.authService = HardCodeAuthService()
        authViewController.authViewModel = authViewModel
        authViewModel.onSuccesAuth = { [weak authViewController] in
            let booksTableViewController = BooksTableViewCoordinator().start()
            booksTableViewController.navigationItem.title = "Books"
            authViewController?.navigationController?.pushViewController(booksTableViewController, animated: true)
        }
        authViewModel.onRegScreen = { [weak authViewController] in
            let regViewController = RegistrationCoordinator().start()
            authViewController?.navigationController?.pushViewController(regViewController, animated: true)
        }
        
        return UINavigationController(rootViewController: authViewController)
    }
}
