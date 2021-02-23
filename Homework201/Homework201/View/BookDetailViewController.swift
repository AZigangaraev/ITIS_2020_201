//
//  BookDetailViewController.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol BookDetailView: AnyObject {
    func setBook(book: Book)
    func setBookAvailable()
    func setBookPurchased()
    func showPurchaseFailed(message: String)
}

class BookDetailViewController: UIViewController, BookDetailView {
    var presenter: BookDetailViewControllerPresenter?
    
    @IBOutlet private var coverImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!
    @IBOutlet private var buyButton: UIButton!
    
    private var book: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let book = book else { return }
        coverImageView.image = UIImage(named: book.image)
        titleLabel.text = book.title
        title = book.title
        authorLabel.text = book.author
        yearLabel.text = String(book.year)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.onViewWillAppear()
    }
        
    func setBook(book: Book) {
        self.book = book
    }
    
    func setBookAvailable() {
        buyButton.isEnabled = true
        buyButton.setTitle("Buy (\(book.price) ₽)", for: .normal)
    }
    
    func setBookPurchased() {
        buyButton.isEnabled = false
        buyButton.setTitle("Purchased", for: .disabled)
    }
    
    func showPurchaseFailed(message: String) {
        let alert = UIAlertController(title: "Purchase Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        presenter?.buy()
    }
}
