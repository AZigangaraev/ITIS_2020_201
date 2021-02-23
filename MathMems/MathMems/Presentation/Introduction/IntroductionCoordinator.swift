//
//  IntroductionCoordinator.swift
//  MathMems
//
//  Created by Никита Ляпустин on 21.02.2021.
//

import UIKit

class IntroductionCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func startViewController() -> UIViewController {
        return firstTaskViewController()
    }
    
    func firstTaskViewController() -> UIViewController {
        let presenter = FirstTaskPresenter()
        let viewController = presenter.viewController()
        presenter.onFinish = { [weak viewController] in
            let nextViewController = self.secondTaskViewController()
            nextViewController.modalPresentationStyle = .fullScreen
            viewController?.show(nextViewController, sender: self)
        }
        return viewController
    }
    
    func secondTaskViewController() -> UIViewController {
        let presenter = SecondTaskPresenter()
        let viewController = presenter.viewController()
        presenter.onFinish = { [weak viewController] in
            let nextViewController = self.finish()
            nextViewController.modalPresentationStyle = .fullScreen
            viewController?.show(nextViewController, sender: self)
        }
        return viewController
    }
    
    func finish() -> UIViewController {
        let nextCoordinator = MainFlowCoordinator()
        let controller = nextCoordinator.startMainFlow()
        
        return controller
    }
}
