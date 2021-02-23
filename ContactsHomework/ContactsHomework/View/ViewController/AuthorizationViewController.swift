//
//  AuthorizationViewController.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var onFinish: (() -> Void)?

    private let authorizationService: AuthorizationService = AuthorizationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func signInTap(_ sender: Any) {
        authorizationService.authorize(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "") { [self] result in
            switch result {
                case .success:
                    finish()
            case .failure(_):
                    showSimpleAlert(title: "Error", message: "Incorrect username or password")
            }
        }
    }
    
    private func finish() {
        onFinish?()
    }
    
    private func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
