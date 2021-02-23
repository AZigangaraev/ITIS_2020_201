//
//  ViewController.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 19.02.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var authViewModel: AuthViewModel?
    
    // MARK -Lifecycle
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        usernameField.text = ""
        passwordField.text = ""
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        authViewModel?.authorize(username: usernameField.text ?? "", password: passwordField.text ?? "")
    }
    
    @IBAction func regButtonAction(_ sender: Any) {
        authViewModel?.registration()
    }
    
}

