//
//  AuthorizationCoordinator.swift
//  Twitter
//
//  Created by Teacher on 16.02.2021.
//

import UIKit

class AuthorizationCoordinator {
    func startViewController() -> UIViewController {
        UINavigationController(rootViewController: phoneNumberController())
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func authorizationController() -> UIViewController {
        let viewController: AuthorizationViewController = storyboard.instantiateViewController(identifier: "AuthorizationViewController")
        viewController.onFinish = { [weak viewController] in
            let twitterController = TwitterCoordinator().startViewController()
            viewController?.navigationController?.pushViewController(twitterController, animated: true)
        }
        return viewController
    }

    private func phoneNumberController() -> UIViewController {
        let viewController: PhoneNumberController = storyboard.instantiateViewController(identifier: "PhoneNumberController")
        viewController.onFinish = { [weak viewController] phoneNumber in
            print("Entered number: \(phoneNumber)")
            viewController?.navigationController?.pushViewController(self.authorizationController(), animated: true)
        }
        return viewController
    }
}
