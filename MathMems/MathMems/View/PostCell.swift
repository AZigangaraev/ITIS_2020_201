//
//  PostCell.swift
//  MathMems
//
//  Created by Никита Ляпустин on 22.02.2021.
//

import UIKit

class PostCell: UITableViewCell {
    
    var likeTap: (() -> Void)?
    var post: Post? {
        didSet {
            guard let post = post else { return }

            postImage.image = post.image
            likeButton.setTitle("❤️\(post.likes)", for: .normal)
        }
    }
    
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBAction func likeTap(_ sender: Any) {
        likeTap?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let post = post else { return }
        
        let ratio = post.image.size.width / post.image.size.height
        
        widthConstraint.constant = self.frame.width
        
        heightConstraint.constant = widthConstraint.constant / ratio
    }
}
