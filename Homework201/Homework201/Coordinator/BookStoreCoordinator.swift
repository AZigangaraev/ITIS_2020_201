//
//  UserBooksCoordinator.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

class BookStoreCoordinator {
    private let navigationController: UINavigationController
    private let serviceFactory: ServiceFactory
    
    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }
    
    func start() {
        navigationController.tabBarItem = UITabBarItem(title: "Book Store", image: UIImage(systemName: "bag.fill"), selectedImage: nil)
        let presenter = getBookStorePresenter { [self] selectedBook in
            let detailPresenter = getBookDetailPresenter {
                let authorizationCoordinator = AuthorizationCoordinator(navigationController: navigationController, serviceFactory: serviceFactory)
                authorizationCoordinator.start()
            }
            detailPresenter.book = selectedBook
            detailPresenter.start(in: navigationController)
        }
        presenter.start(in: navigationController)
    }
    
    func getBookStorePresenter(onBookSelected: ((Book) -> Void)?) -> BookStorePresenter {
        let presenter = BookStorePresenter(booksDataService: serviceFactory.makeBooksDataService())
        presenter.onBookSelected = onBookSelected
        return presenter
    }
    
    func getBookDetailPresenter(onUnauthorizedPurchase: (() -> Void)?) -> BookDetailPresenter {
        let presenter = BookDetailPresenter(userService: serviceFactory.makeUserService())
        presenter.onUnauthorizedPurchase = onUnauthorizedPurchase
        return presenter
    }
}
