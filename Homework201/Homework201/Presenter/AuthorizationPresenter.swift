//
//  AuthorizationPresenter.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol AuthorizationViewControllerPresenter {
    var onAuthorizationSuccess: (() -> Void)? { get set }
    func authorize(email: String, password: String)
}

class AuthorizationPresenter: AuthorizationViewControllerPresenter {
    private weak var view: AuthorizationView!
    
    var onAuthorizationSuccess: (() -> Void)?
    
    let authorizationService: AuthorizationService
    
    init(authorizationService: AuthorizationService) {
        self.authorizationService = authorizationService
    }
    
    func start(in navigationController: UINavigationController) {
        let authorizationVC = AuthorizationViewController.instantiate()
        authorizationVC.presenter = self
        view = authorizationVC
        navigationController.pushViewController(authorizationVC, animated: true)
    }
    
    func authorize(email: String, password: String) {
        authorizationService.authorize(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                AppDelegate.user = user
                self?.onAuthorizationSuccess?()
            case .failure(let authorizationError):
                switch authorizationError {
                case .noSuchEmail:
                    self?.view.showAuthorizationFailed(message: "User with such an email doesn't exist.")
                case .wrongPassword:
                    self?.view.showAuthorizationFailed(message: "Invalid password.")
                }
            }
        }
    }
}
