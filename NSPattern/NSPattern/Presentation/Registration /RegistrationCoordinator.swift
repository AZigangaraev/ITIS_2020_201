//
//  RegistrationCoordinator.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import UIKit

class RegistrationCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func start() -> UIViewController  {
        registrationController()
    }

    private func registrationController() -> UIViewController {
        let viewController: RegistrationViewController = storyboard.instantiateViewController(identifier: "RegistrationViewController")
        let viewModel = HardCodeRegistrationViewModel()
        viewModel.onFinish = { [weak viewController] in
            viewController?.navigationController?.popToRootViewController(animated: true)
        }
        viewController.regViewModel = viewModel
        return viewController
    }
}
