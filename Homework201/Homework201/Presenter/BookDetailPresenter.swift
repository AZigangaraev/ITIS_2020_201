//
//  BookDetailPresenter.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol BookDetailViewControllerPresenter {
    func onViewWillAppear()
    var onUnauthorizedPurchase: (() -> Void)? { get set }
    func buy()
}

class BookDetailPresenter: BookDetailViewControllerPresenter {
    var book: Book!
    
    var onUnauthorizedPurchase: (() -> Void)?
    
    let userService: UserService
    
    private weak var view: BookDetailView!
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func start(in navigationController: UINavigationController) {
        let bookDetailVC = BookDetailViewController.instantiate()
        bookDetailVC.presenter = self
        view = bookDetailVC
        view.setBook(book: book)
        navigationController.pushViewController(bookDetailVC, animated: true)
    }
    
    func onViewWillAppear() {
        loadPurchaseInformation()
    }
    
    private func loadPurchaseInformation() {
        guard let user = AppDelegate.user else {
            view.setBookAvailable()
            return
        }
        if userService.doesUserHaveBook(userId: user.id, bookId: book.id) {
            view.setBookPurchased()
            return
        }
        view.setBookAvailable()
    }
    
    func buy() {
        guard let user = AppDelegate.user else {
            onUnauthorizedPurchase?()
            return
        }
        
        userService.purchaseBook(userId: user.id, bookId: book.id) { [weak self] result in
            switch result {
            case .success(()):
                self?.loadPurchaseInformation()
            case .failure(.bookPurchaseFailed):
                self?.view.showPurchaseFailed(message: "An error occurred.")
            }
        }
    }
}
