//
//  AuthorizationCoordinator.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation
import UIKit


class AuthorizationCoordinator {
    func startViewController() -> UIViewController {
        UINavigationController(rootViewController: authorizationController())
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func authorizationController() -> UIViewController {
        let viewController: AuthorizationViewController = storyboard.instantiateViewController(identifier: "AuthorizationViewController")
        viewController.onFinish = { [weak viewController] in
            let profileController = ProfileCoordinator().viewController()
            viewController?.navigationController?.pushViewController(profileController, animated: true)
        }
        return viewController
    }
    
}
