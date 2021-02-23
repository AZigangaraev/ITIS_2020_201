//
//  ViewController.swift
//  MathMems
//
//  Created by Никита Ляпустин on 21.02.2021.
//

import UIKit

protocol FirstTaskViewControllerPresenter {
    func setTask()
    func checkAnswer(answer: String)
}

class FirstTaskViewController: UIViewController {
    
    @IBOutlet var taskImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var answerBtn: UIButton!
    
    var onFinish: (() -> Void)?
    var presenter: FirstTaskViewControllerPresenter?
    var task: FirstTask?
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.setTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func answerBtnTapped(_ sender: Any) {
        if let answer = answerTextField.text {
            presenter?.checkAnswer(answer: answer)
        } else {
            return
        }
    }
    
}

