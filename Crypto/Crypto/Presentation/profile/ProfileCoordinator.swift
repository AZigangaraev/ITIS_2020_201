//
//  ProfileCoordinator.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation
import UIKit

class ProfileCoordinator{
    func startViewController() -> UIViewController {
        let name1: String? = UserDefaults.standard.value(forKey: "name") as? String
        if(name1 != nil){
            print("work10")
            return UINavigationController(rootViewController: profileController())
        } else {
            return authorizationController()
        }
    }
    
    func viewController() -> UIViewController {
        profileController()
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func profileController() -> UIViewController {
        let viewController: ProfileViewController = storyboard.instantiateViewController(identifier: "profileViewController")
        viewController.onFinish = { [weak viewController] in
            let AuthorizationController = AuthorizationCoordinator().authorizationController()
            viewController?.navigationController?.pushViewController(AuthorizationController, animated: true)
        }
        return viewController
    }
    
    private func authorizationController() -> UIViewController {
        let viewController = AuthorizationCoordinator().startViewController()
//        viewController.onFinish = { [weak viewController] in
//            let profileController = self.storyboard.instantiateViewController(identifier: "startViewController")
//            viewController?.navigationController?.pushViewController(profileController, animated: true)
//        }
        return viewController
    }

}
