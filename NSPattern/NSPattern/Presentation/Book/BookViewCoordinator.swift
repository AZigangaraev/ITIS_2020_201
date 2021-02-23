//
//  BookViewCoordinator.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import UIKit

class BookViewCoordinator {
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func start() -> UIViewController {
        bookViewController()
    }

    private func bookViewController() -> UIViewController {
        let bookViewController: BookViewController = storyboard.instantiateViewController(identifier: "BookViewController")
        return bookViewController
    }
}
