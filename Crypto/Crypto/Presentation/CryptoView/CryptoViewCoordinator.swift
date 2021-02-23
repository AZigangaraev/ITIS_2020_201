//
//  CryptoViewCoordinator.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation
import UIKit


class CryptoViewCoordinator {
    func startViewController() -> UIViewController {
        cryptoController()
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func cryptoController() -> UIViewController {
        let viewController: CryptoViewController = storyboard.instantiateViewController(identifier: "CryptoViewController")
        viewController.onFinish = { [weak viewController] in
            let AuthorizationController = AuthorizationCoordinator().startViewController()
            viewController?.navigationController?.pushViewController(AuthorizationController, animated: true)
        }
        return viewController
    }
    
}
