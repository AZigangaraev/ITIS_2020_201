//
//  FirstTaskPresenter.swift
//  MathMems
//
//  Created by Никита Ляпустин on 21.02.2021.
//

import UIKit

class FirstTaskPresenter: FirstTaskViewControllerPresenter {
    
    private weak var view: FirstTaskViewController!
    private var firstTaskService = FirstTaskService()
    var onFinish: (() -> Void)?
    
    func setTask() {
        let task = firstTaskService.getTask()
        view.task = task
        view.taskImage.image = task.question
    }
    
    func checkAnswer(answer: String) {
        if let task = view.task {
            if firstTaskService.checkAnswer(task: task, answer: Int(answer) ?? 0) {
                view.resultLabel.text = "Правильно!"
                view.resultLabel.textColor = .green
                view.answerBtn.isEnabled = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.onFinish?()
                }
            } else {
                view.resultLabel.text = "Неправильно!"
                view.resultLabel.textColor = .red
            }
        } else {
            view.resultLabel.text = "Неправильно!"
            view.resultLabel.textColor = .red
        }
    }
    
    func start(in navigationController: UINavigationController) {
        navigationController.pushViewController(viewController(), animated: true)
    }
    
    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: FirstTaskViewController = storyboard.instantiateViewController(identifier: "FirstTaskViewController")
        controller.presenter = self
        view = controller
        view.loadViewIfNeeded()
        setTask()
        return controller
    }
}
