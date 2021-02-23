//
//  BookStoreViewController.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

protocol BookStoreView: AnyObject {
    func set(books: [Book])
}

class BookStoreViewController: UIViewController, BookStoreView, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: BookStoreViewControllerPresenter?
    
    @IBOutlet private var tableView: UITableView!
    private var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - BookStoreView
    
    func set(books: [Book]) {
        self.books = books
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else {
            fatalError("Could not dequeue cell")
        }
        cell.book = books[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.onBookSelected?(books[indexPath.row])
    }
}

// MARK: - BookCell

class BookCell: UITableViewCell {
    var book: Book? {
        didSet {
            guard let book = book else { return }
            textLabel?.text = book.title
            detailTextLabel?.text = book.author
            
            let priceLabel = UILabel()
            priceLabel.text = "\(book.price) ₽"
            priceLabel.textColor = .darkGray
            priceLabel.sizeToFit()
            accessoryView = priceLabel
        }
    }
}
