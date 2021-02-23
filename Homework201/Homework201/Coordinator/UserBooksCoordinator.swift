//
//  BookStoreCoordinator.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

class UserBooksCoordinator {
    private let navigationController: UINavigationController
    private let serviceFactory: ServiceFactory
    
    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "My Books", image: UIImage(systemName: "book.fill"), selectedImage: nil)
        let presenter = getUserBooksPresenter { [self] book in
            let readingPresenter = getReadingPresenter()
            readingPresenter.book = book
            readingPresenter.start(in: navigationController)
        } onSignInPressed: { [self] in
            let authorizationCoordinator = AuthorizationCoordinator(navigationController: navigationController, serviceFactory: serviceFactory)
            authorizationCoordinator.start()
        }
        presenter.start(in: navigationController)
    }
    
    func getUserBooksPresenter(onBookSelected: ((Book) -> Void)?, onSignInPressed: (() -> Void)?) -> UserBooksPresenter {
        let presenter = UserBooksPresenter(booksDataService: serviceFactory.makeBooksDataService(), userService: serviceFactory.makeUserService())
        presenter.onBookSelected = onBookSelected
        presenter.onSignInPressed = onSignInPressed
        return presenter
    }
    
    func getReadingPresenter() -> ReadingPresenter {
        let presenter = ReadingPresenter(booksDataService: serviceFactory.makeBooksDataService())
        return presenter
    }
}
