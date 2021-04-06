//
//  ViewController.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    var onFinish: (() -> Void)?
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    
    private let authorizathionService: AuthorizationService = AuthorizationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        authorizathionService.authorize(username: loginTextField.text ?? "", password: passwordTextField.text ?? "") { result in
            switch result {
                case .success:
                    self.finish()
                case .failure(let error):
                    print("Couldn't authorize: \(error)")
            }
        }
    }
    
    private func finish() {
        onFinish?()
    }
    
    



}

