//
//  UserBooksPresenter.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol UserBooksViewControllerPresenter {
    var onBookSelected: ((Book) -> Void)? { get set }
    var onSignInPressed: (() -> Void)? { get set }
    func onViewWillAppear()
    func signOut()
}

class UserBooksPresenter: UserBooksViewControllerPresenter {
    let booksDataService: BooksDataService
    let userService: UserService
    
    var onBookSelected: ((Book) -> Void)?
    var onSignInPressed: (() -> Void)?
    
    private weak var view: UserBooksView!
    
    init(booksDataService: BooksDataService, userService: UserService) {
        self.booksDataService = booksDataService
        self.userService = userService
    }
        
    func start(in navigationController: UINavigationController) {
        let userBooksVC = UserBooksViewController.instantiate()
        userBooksVC.presenter = self
        view = userBooksVC
        navigationController.pushViewController(userBooksVC, animated: false)
    }
    
    func onViewWillAppear() {
        reloadView()
    }
    
    private func reloadView() {
        guard let user = AppDelegate.user else {
            view.requireSignIn()
            return
        }
        
        let bookIds = userService.getUserBooks(userId: user.id)
        let books = booksDataService.getBooks(withIds: bookIds)
        view.set(books: books)
        view.showTableView()
    }
    
    func signOut() {
        AppDelegate.user = nil
        reloadView()
    }
}
