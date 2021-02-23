//
//  NameRefactorViewController.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import UIKit

class NameRefactorViewController: UIViewController {
    var onFinish: (() -> Void)?
    @IBOutlet weak var nameTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
     @IBAction func saveBtn(_ sender: Any) {
        onFinish?()
     }

    

}
