//
//  TwitterCoordinator.swift
//  Twitter
//
//  Created by Teacher on 16.02.2021.
//

import UIKit

class TwitterCoordinator {
    var onFinish: (() -> Void)?

    func startViewController() -> UIViewController {
        twitterController()
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func twitterController() -> UIViewController {
        let viewController: TwitterViewController = storyboard.instantiateViewController(identifier: "TwitterViewController")
        let viewModel = TwitterViewModelImplementation()
        viewModel.onFinish = { [weak viewController] in
            viewController?.navigationController?.popToRootViewController(animated: true)
        }
        viewController.viewModel = viewModel
        return viewController
    }
}
