//
//  ViewController.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    var viewModel: DetailViewModelType?
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.descLabel.text = viewModel?.description
        self.phoneLabel.text = viewModel?.phone
    }

    @IBAction func nameEdit(_ sender: Any) {
    }
    
    @IBAction func phoneEdit(_ sender: Any) {
    }
}

