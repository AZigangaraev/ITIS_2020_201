//
//  SecondTaskPresenter.swift
//  MathMems
//
//  Created by Никита Ляпустин on 22.02.2021.
//

import UIKit

class SecondTaskPresenter: SecondTaskViewControllerPresenter {
    
    var onFinish: (() -> Void)?
    private weak var view: SecondTaskViewController!
    
    func reactToTap() {
        view.theoremImage.isHidden = false
        view.answerBtn.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.onFinish?()
        }
    }
    
    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: SecondTaskViewController = storyboard.instantiateViewController(identifier: "SecondTaskViewController")
        controller.presenter = self
        view = controller
        view.loadViewIfNeeded()
        view.theoremImage.isHidden = true
        return controller
    }
}
