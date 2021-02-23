//
//  SecondTaskViewController.swift
//  MathMems
//
//  Created by Никита Ляпустин on 22.02.2021.
//

import UIKit

protocol SecondTaskViewControllerPresenter {
    func reactToTap()
}

class SecondTaskViewController: UIViewController {

    @IBOutlet var theoremImage: UIImageView!
    @IBOutlet var answerBtn: UIButton!
    
    var presenter: SecondTaskViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func asnwerBtnTapped(_ sender: Any) {
        presenter?.reactToTap()
    }
    
}
