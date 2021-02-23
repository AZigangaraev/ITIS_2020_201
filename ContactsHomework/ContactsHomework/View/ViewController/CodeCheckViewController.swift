//
//  CodeCheckViewController.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class CodeCheckViewController: UIViewController {

    @IBOutlet var codeTextField: UITextField!
    
    private let authorizationService: AuthorizationService = AuthorizationService()
    
    var onFinish: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendCodeTap(_ sender: Any) {
        authorizationService.checkCode(code: codeTextField.text ?? "") { [self] result in
            switch result {
                case .success:
                    finish()
            case .failure(_):
                    showSimpleAlert(title: "Error", message: "Incorrect 4-digit code")
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
