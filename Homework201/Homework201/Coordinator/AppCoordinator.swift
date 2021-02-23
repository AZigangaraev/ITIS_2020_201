//
//  AppCoordinator.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let serviceFactory: ServiceFactory
    
    init(window: UIWindow, serviceFactory: ServiceFactory) {
        self.window = window
        self.serviceFactory = serviceFactory
    }
    
    func start() {
        let firstVC = UINavigationController()
        let bookStoreCoordinator = BookStoreCoordinator(navigationController: firstVC, serviceFactory: serviceFactory)
        bookStoreCoordinator.start()
        
        let secondVC = UINavigationController()
        let userBooksCoordinator = UserBooksCoordinator(navigationController: secondVC, serviceFactory: serviceFactory)
        userBooksCoordinator.start()
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstVC, secondVC]
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
