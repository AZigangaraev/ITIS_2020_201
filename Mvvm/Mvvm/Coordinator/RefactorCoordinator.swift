//
//  RefactorCoordinator.swift
//  Mvvm
//
//  Created by Nail on 22.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import Foundation
import UIKit

class RefactorCoordinator {
    func startVC() -> UIViewController {
        UINavigationController(rootViewController: phoneViewController())
    }
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    func nameViewController() -> UIViewController {
        let vc: NameRefactorViewController = storyboard.instantiateViewController(identifier: "NameRefactorViewController")
        let tableController = TableViewCoordinator().startViewController()
        vc.onFinish = { [weak vc] in
            vc?.navigationController?.pushViewController(tableController, animated: true)
            
        }
            
        return vc
    }
    
    func phoneViewController() -> UIViewController {
        let vc: PhoneRefactorViewController = storyboard.instantiateViewController(identifier: "PhoneRefactorViewController")
        vc.onFinish = { [weak vc] phoneNumber in
            print("Entered number: \(phoneNumber)")
            vc?.navigationController?.pushViewController(self.nameViewController(), animated: true)
        }
        return vc
    }
}
