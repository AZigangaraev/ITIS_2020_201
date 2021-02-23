//
//  PostCell.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class PostCell: UITableViewCell {
    var post: Post? {
        didSet {
            guard let post = post else { return }
            postTextLabel.text = post.text
            likesLabel.text = "\(post.likes)"
        }
    }
    
    var like: (() -> Void)?
    
    @IBOutlet var postTextLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    @IBAction func likeTap(_ sender: Any) {
        like?()
    }
}
