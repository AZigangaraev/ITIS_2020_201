//
//  PhoneRefactorViewController.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import UIKit

class PhoneRefactorViewController: UIViewController {
    var onFinish: ((_ phoneNumber: String) -> Void)?
    @IBOutlet weak var phoneTF: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveBtn(_ sender: Any) {
         onFinish?(phoneTF.text ?? "")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
