//
//  ReadingPresenter.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

class ReadingPresenter {
    var book: Book!
    
    let booksDataService: BooksDataService
    
    private weak var view: ReadingView!
    
    init(booksDataService: BooksDataService) {
        self.booksDataService = booksDataService
    }
    
    func start(in navigationController: UINavigationController) {
        let readingVC = ReadingViewController.instantiate()
        readingVC.presenter = self
        view = readingVC
        view.setText(text: getBookContents(for: book))
        view.setTitle(title: book.title)
        navigationController.pushViewController(readingVC, animated: true)
    }
    
    func getBookContents(for book: Book) -> String {
        booksDataService.getBookContent(forBookWithId: book.id)
    }
}
