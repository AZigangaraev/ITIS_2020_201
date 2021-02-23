//
//  AuthorizationCoordinator.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

class AuthorizationCoordinator {
    private let navigationController: UINavigationController
    private let serviceFactory: ServiceFactory
    
    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }
    
    func start() {
        let presenter = getAuthorizationPresenter {
            self.navigationController.popViewController(animated: true)
        }
        presenter.start(in: navigationController)
    }
    
    func getAuthorizationPresenter(onAuthorizationSuccess: (() -> Void)?) -> AuthorizationPresenter {
        let presenter = AuthorizationPresenter(authorizationService: serviceFactory.makeAuthorizationService())
        presenter.onAuthorizationSuccess = onAuthorizationSuccess
        return presenter
    }
}
