//
//  MockBooksDataService2.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import Foundation

class MockBooksDataService2: BooksDataService {
    var books: [Book] = [Book(id: 1, author: "Leo Tolstoy", title: "War and Peace", year: 1867, price: 500, image: "war_and_peace")]
    
    func getBooks(withIds ids: Set<Int>) -> [Book] {
        []
    }
    
    func getBookContent(forBookWithId: Int) -> String {
        "Lorem ipsum dolor sit amet"
    }
}
