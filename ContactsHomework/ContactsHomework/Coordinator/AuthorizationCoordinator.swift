//
//  AuthorizationCoordinator.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class AuthorizationCoordinator {
    func startViewController() -> UIViewController {
        UINavigationController(rootViewController: authorizationController())
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private func authorizationController() -> UIViewController {
        let viewController: AuthorizationViewController = storyboard.instantiateViewController(identifier: "AuthorizationViewController")
        viewController.onFinish = { [weak viewController] in
            viewController?.navigationController?.pushViewController(self.codeCheckViewController(), animated: true)
        }
        return viewController
    }
    
    private func codeCheckViewController() -> UIViewController {
        let viewController: CodeCheckViewController = storyboard.instantiateViewController(identifier: "CodeCheckViewController")
        viewController.onFinish = { [weak viewController] in
            viewController?.navigationController?.pushViewController(self.welcomeViewController(), animated: true)
        }
        return viewController
    }
    
    private func welcomeViewController() -> UIViewController {
        let viewController: WelcomeViewController = storyboard.instantiateViewController(identifier: "WelcomeViewController")
        viewController.onFinish = { [weak viewController] in
            let usersController = UsersCoordinator().startViewController()
            usersController.modalPresentationStyle = .fullScreen
            viewController?.present(usersController, animated: true)
        }
        return viewController
    }}
