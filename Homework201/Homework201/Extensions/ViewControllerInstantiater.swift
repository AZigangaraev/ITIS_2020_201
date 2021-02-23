//
//  ViewControllerInstantiater.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 22.02.2021.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: className) as! Self
    }
}
