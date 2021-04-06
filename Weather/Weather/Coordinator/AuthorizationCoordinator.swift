//
//  AuthorizationCoordinator.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class AuthorizationCoordinator {
    
    func startViewController() -> UIViewController {
        UINavigationController(rootViewController: authorizationController())
    }
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private func authorizationController() -> UIViewController {
        let viewController: LoginViewController = storyboard.instantiateViewController(identifier: "LoginViewController")
        viewController.onFinish = { [weak viewController] in
            let mainController = MainCoordinator().startViewController()
            viewController?.navigationController?.pushViewController(mainController, animated: true)
        }
        return viewController
    }

}
