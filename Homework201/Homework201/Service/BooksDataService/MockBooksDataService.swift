//
//  MockBooksDataService.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

class MockBooksDataService: BooksDataService {
    var books: [Book] = [
        Book(id: 1, author: "Leo Tolstoy", title: "War and Peace", year: 1867, price: 500, image: "war_and_peace"),
        Book(id: 2, author: "Arthur Conan Doyle", title: "The Adventures of Sherlock Holmes", year: 1892, price: 300, image: "sherlock"),
        Book(id: 3, author: "John Ronald Reuel Tolkien", title: "The Hobbit", year: 1937, price: 350, image: "hobbit"),
        Book(id: 4, author: "Joanne Rowling", title: "Harry Potter and the Philosopher's Stone", year: 1997, price: 250, image: "hp"),
        Book(id: 5, author: "Charles Dickens", title: "Oliver Twist", year: 1838, price: 400, image: "oliver_twist"),
        Book(id: 6, author: "Mikhail Bulgakov", title: "The Master and Margarita", year: 1966, price: 500, image: "master_and_margarita"),
        Book(id: 7, author: "Fyodor Dostoyevsky", title: "Crime and Punishment", year: 1866, price: 450, image: "crime_and_punishment")
    ]
    
    func getBooks(withIds ids: Set<Int>) -> [Book] {
        return books.filter { ids.contains($0.id) }
    }
    
    func getBookContent(forBookWithId: Int) -> String {
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras faucibus faucibus ligula quis volutpat. Pellentesque at ligula ut nulla efficitur egestas non sit amet est. Phasellus iaculis consectetur efficitur. Curabitur volutpat metus nisi. Duis vel cursus nibh, eget volutpat sem. Etiam pulvinar rhoncus ligula vitae porttitor. Maecenas ut nulla condimentum dui aliquet tincidunt. Mauris vel nulla non magna auctor consequat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc pellentesque semper accumsan. Sed luctus libero et libero varius, in venenatis libero condimentum. Vestibulum rhoncus porttitor erat, non accumsan lacus blandit nec. In nunc libero, mollis ac urna eu, tincidunt tincidunt elit."
    }
}
