//
//  BooksTableViewModel.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import Foundation

protocol BooksTableViewModel {
    var booksClosure: (([Book]) -> Void)? { get set }
    func detailBook(book: Book)
    func loadData()
}

class HardCodeBooksTableViewModel: BooksTableViewModel {
    
    var booksClosure: (([Book]) -> Void)?
    var onNextScreen: ((Book) -> Void)?
    var booksService: BookDataService?
    
    private var books: [Book] = []
    
    func loadData() {
        books = booksService?.getBooks() ?? []
        booksClosure?(books)
    }
    
    func detailBook(book: Book) {
        onNextScreen?(book)
    }
    
}
