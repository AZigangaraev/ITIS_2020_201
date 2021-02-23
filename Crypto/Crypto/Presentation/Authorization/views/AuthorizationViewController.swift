//
//  AuthorizationViewController.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet private weak var login: UITextField!
    @IBOutlet private weak var password: UITextField!
    
    var onFinish: (() -> Void)?

    
    private let authorizationService: AuthorizationService = AuthorizationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

    @IBAction func signIn(_ sender: Any) {
        authorizationService.authorize(username: login.text ?? "", password: password.text ?? "") { result in
            switch result {
                case .success:
                    self.finish()
                case .failure(let error):
                    print("Could not authorize: \(error)")
            }
        }
    }
    
    private func finish() {
        print("work1")
        UserDefaults.standard.setValue(login.text, forKeyPath: "name")
        onFinish?()
    }
    
//    private func navigateToProfile() {
//
//        UserDefaults.standard.setValue(login.text, forKeyPath: "name")
//        guard let controller = storyboard?.instantiateViewController(identifier: "startViewController") else {
//            fatalError("Could not instantiate controller")
//        }
//
//        self.navigationController!.pushViewController(controller, animated: true)
//    }
    

}
