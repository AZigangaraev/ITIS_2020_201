//
//  BookTableViewCell.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var likesLabel: UILabel!
    
    func setBookData(book: Book) {
        nameLabel.text = "\"\(book.name)\""
        likesLabel.text = String(book.likes)
    }

}
