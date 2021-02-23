//
//  TableViewCell.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            phoneNumber.text = viewModel?.phone
            nameLabel.text = viewModel?.name
        }
    }

}
