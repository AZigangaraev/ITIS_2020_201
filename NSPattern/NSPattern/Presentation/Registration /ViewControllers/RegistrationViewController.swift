//
//  RegistrationViewController.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var regViewModel: RegistrationViewModel? 

    @IBAction func regButtonAction(_ sender: Any) {
        regViewModel?.saveData(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
}
