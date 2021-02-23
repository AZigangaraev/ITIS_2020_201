//
//  BookStorePresenter.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

protocol BookStoreViewControllerPresenter {
    var onBookSelected: ((Book) -> Void)? { get set }
}

class BookStorePresenter: BookStoreViewControllerPresenter {
    var onBookSelected: ((Book) -> Void)?
    
    let booksDataService: BooksDataService
    
    private weak var view: BookStoreView!

    init(booksDataService: BooksDataService) {
        self.booksDataService = booksDataService
    }
        
    func start(in navigationController: UINavigationController) {
        let booksStoreVC = BookStoreViewController.instantiate()
        booksStoreVC.presenter = self
        view = booksStoreVC
        view.set(books: booksDataService.books)
        navigationController.pushViewController(booksStoreVC, animated: false)
    }
}
