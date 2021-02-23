//
//  BookViewController.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.cornerRadius = descriptionTextView.bounds.height / 20
    }
    
    func setData(book: Book) {
        nameLabel.text = book.name
        authorNameLabel.text = book.authorName
        descriptionTextView.text = "Description: \n \n \(book.description)"
    }
    
}
