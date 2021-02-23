//
//  PurseCoordinator.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation
import UIKit


class PurseCoordinator {
    func startViewController() -> UIViewController {
        PurseViewController()
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func cryptoController() -> UIViewController {
        let viewController: PurseViewController = storyboard.instantiateViewController(identifier: "PurseViewController")
        viewController.onFinish = { [weak viewController] in
            let AuthorizationController = AuthorizationCoordinator().startViewController()
            viewController?.navigationController?.pushViewController(AuthorizationController, animated: true)
        }
        return viewController
    }
    
}
