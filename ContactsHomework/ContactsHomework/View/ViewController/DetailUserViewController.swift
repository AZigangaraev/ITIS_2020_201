//
//  DetailUserViewController.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class DetailUserViewController: UIViewController {

    var user: User?
    
    var onFinish: ((User) -> Void)?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            nameLabel?.text = user.username
            statusLabel?.text = user.status
        }
    }
    

    @IBAction func goToUsersPostsTap(_ sender: Any) {
        guard let user = user else {
            return
        }
        onFinish?(user)
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
