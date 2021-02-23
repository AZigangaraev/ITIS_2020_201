//
//  CryptoTableViewCell.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import UIKit

import UIKit

class CryptoTableViewCell: UITableViewCell {

     private  var name: UILabel!
     private  var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(name1: String, quantity1: Int){
        print("1:\(name1)")
        name = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height/2))
        name.text = name1
        self.addSubview(name)
        quantity = UILabel(frame: CGRect(x: 0, y: bounds.height/2, width: bounds.width, height: bounds.height/2))
        quantity.text = String(quantity1)
        quantity.textAlignment = .right
        self.addSubview(quantity)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
