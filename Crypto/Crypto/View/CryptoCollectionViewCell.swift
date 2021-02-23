//
//  CryptoCollectionViewCell.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import UIKit

class CryptoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var price: UILabel!
    

    func set( name1: String, price1: String, size: Int, index: Int ) {
        var x = 0
        if (index+1)%2 == 0 {
            x = size + 5
        }
        var y = Int(index/2) * size
        if(y > 0) {
            y = y + 5
        }
        
        self.frame = CGRect(x: x, y: y, width: size, height: size)
        
        name.text = name1
        price.text = price1 + "$"
    }
    
}
