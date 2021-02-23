//
//  BookTableViewCoordinator.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import UIKit

class BooksTableViewCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private let serviceFactory: ServiceFactory
    
    init(factoryService: ServiceFactory) {
        serviceFactory = factoryService
    }
    
    func start() -> UIViewController {
        tableViewController()
    }

    private func tableViewController() -> UIViewController {
        let booksTableViewController: BooksTableViewController = storyboard.instantiateViewController(identifier: "BooksTableViewController")
        let viewModel = HardCodeBooksTableViewModel()
        viewModel.booksService = serviceFactory.makeBooksDataService()
        if let bookViewController = BookViewCoordinator().start() as? BookViewController {
            viewModel.onNextScreen = { [weak booksTableViewController] (book) in
                bookViewController.loadViewIfNeeded()
                bookViewController.setData(book: book)
                booksTableViewController?.navigationController?.pushViewController(bookViewController, animated: true)
            }
        }
        booksTableViewController.viewModel = viewModel
        return booksTableViewController
    }
}
