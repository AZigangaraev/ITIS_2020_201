//
//  ContactCell.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
//

import UIKit

class ContactCell: UITableViewCell {
    
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var phoneNameLbl: UILabel!
    @IBOutlet weak var phoneContactImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupDataFromModel(model: ContactModel) {
        self.phoneNumberLbl.text = model.contactNumber
        self.phoneNameLbl.text = model.contactName
        phoneContactImg.layer.masksToBounds = false
        phoneContactImg.layer.borderColor = UIColor.black.cgColor
        phoneContactImg.layer.cornerRadius = phoneContactImg.frame.height/2
        phoneContactImg.clipsToBounds = true
    }
    
}
