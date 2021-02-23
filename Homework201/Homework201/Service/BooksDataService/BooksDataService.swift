//
//  BooksDataService.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import Foundation

protocol BooksDataService {
    var books: [Book] { get }
    func getBooks(withIds ids: Set<Int>) -> [Book]
    func getBookContent(forBookWithId: Int) -> String
}
