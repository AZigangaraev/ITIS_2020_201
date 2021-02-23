//
//  BookService.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import Foundation

enum BookError: Error {
    case bookNotFound
}

protocol BookDataService {
    func getBooks() -> [Book]
}
