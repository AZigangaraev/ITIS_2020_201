//
//  AuthorizationCoordinator.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
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
            viewController?.navigationController?.pushViewController(self.imageController(), animated: true)
        }
        return viewController
    }
    
    private func imageController() -> UIViewController {
        let viewController: ImageViewController = storyboard.instantiateViewController(identifier: "ImageViewController")
        viewController.onFinish = { [weak viewController] in
            viewController?.navigationController?.popToRootViewController(animated: true)
        }
        viewController.toNext = { [weak viewController] in
            let contactController = ContactCoordinator().startViewController()
            viewController?.navigationController?.pushViewController(contactController, animated: true)
        }
        return viewController
    }
}
