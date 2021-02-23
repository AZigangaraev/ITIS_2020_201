//
//  ContactCoordinator.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
//

import UIKit

class ContactCoordinator {
    var onFinish: (() -> Void)?

    func startViewController() -> UIViewController {
        contactController()
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func contactController() -> UIViewController {
        let viewController: ContactViewController = storyboard.instantiateViewController(identifier: "ContactViewController")
        viewController.onFinish = { [weak viewController] in
            viewController?.navigationController?.popToRootViewController(animated: true)
        }
        return viewController
    }
    
    private func tasksController() -> UIViewController {
        let viewController: TasksViewController = storyboard.instantiateViewController(identifier: "TasksViewController")
        viewController.onFinish = { [weak viewController] in
            let authorizationController = AuthorizationCoordinator().startViewController()
            viewController?.navigationController?.pushViewController(authorizationController, animated: true)
        }
        return viewController
    }
}
