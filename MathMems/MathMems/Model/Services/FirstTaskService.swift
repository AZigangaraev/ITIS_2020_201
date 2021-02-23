//
//  FirstTaskService.swift
//  MathMems
//
//  Created by Никита Ляпустин on 21.02.2021.
//

import Foundation

class FirstTaskService {
    
    let tasks: [FirstTask] = [FirstTask(question: #imageLiteral(resourceName: "FT3"), rightAnswer: 23),
                              FirstTask(question: #imageLiteral(resourceName: "FT1"), rightAnswer: 7),
                              FirstTask(question: #imageLiteral(resourceName: "FT5"), rightAnswer: 15)]
    
    func getTask() -> FirstTask {
        let randomNumber = Int.random(in: 0...2)
        return tasks[randomNumber]
    }
    
    func checkAnswer(task: FirstTask, answer: Int) -> Bool {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            return answer == tasks[index].rightAnswer
        } else {
            return false
        }
    }
}
