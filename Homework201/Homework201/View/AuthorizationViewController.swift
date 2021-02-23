//
//  AuthorizationViewController.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol AuthorizationView: AnyObject {
    func showAuthorizationFailed(message: String)
}

class AuthorizationViewController: UIViewController, AuthorizationView {
    var presenter: AuthorizationViewControllerPresenter!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter.authorize(email: email, password: password)
    }
    
    func showAuthorizationFailed(message: String) {
        let alert = UIAlertController(title: "Sign In Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
