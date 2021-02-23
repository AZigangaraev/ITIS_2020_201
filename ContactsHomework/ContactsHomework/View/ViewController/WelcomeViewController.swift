//
//  WelcomeViewController.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var onFinish: (() -> Void)?

    @IBAction func continueTap(_ sender: Any) {
        onFinish?()
    }

}
