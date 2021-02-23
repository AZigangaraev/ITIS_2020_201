//
//  ProfileViewController.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet private weak var firstName: UILabel!
    
    var onFinish: (() -> Void)?
    
    private func finish() {
        UserDefaults.standard.removeObject(forKey: "name")
        onFinish?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = UserDefaults.standard.value(forKey: "name")! as! String
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
   
    
    @IBAction func exit(_ sender: Any) {
        finish()
    }
    
    @IBAction func purse(_ sender: Any) {
        let purseController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PurseViewController")
        self.navigationController?.pushViewController(purseController, animated: true)
    }
    @IBAction func crypto(_ sender: Any) {
        let cryptoController = CryptoViewCoordinator().startViewController()
        self.navigationController?.pushViewController(cryptoController, animated: true)
    }
    
}
