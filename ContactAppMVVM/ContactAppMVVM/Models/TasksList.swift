//
//  TasksList.swift
//  ContactAppMVVM
//
//  Created by Rishat on 22.02.2021.
//

import Foundation

enum Move {
  case append(Task, after: Task)
  case insert(Task, before: Task)
}

struct Task: Hashable, Codable {
  var id: UUID
  var title: String
}

class TaskList {
  var tasks: [Task]

  init(tasks: [Task] = []) {
    self.tasks = tasks
  }

  func appendNew(title: String) -> Task {
    let task = Task(id: UUID(), title: title)
    tasks.append(task)
    return task
  }

  func move<Tasks: Collection>(_ newTasks: Tasks, to index: Int) -> [Move]? where Tasks.Element == Task {
    let oldIDs = newTasks.reduce(into: Set()) { $0.insert($1.id) }
    tasks.removeAll { oldIDs.contains($0.id) }

    guard !tasks.isEmpty else {
      tasks.append(contentsOf: newTasks)
      return nil
    }

    var moves: [Move] = []

    if index >= tasks.endIndex {
      for task in newTasks {
        let oldTask = tasks.last!
        tasks.append(task)
        moves.append(.append(task, after: oldTask))
      }
    } else {
      for task in newTasks.reversed() {
        let oldTask = tasks[index]
        tasks.insert(task, at: index)
        moves.append(.insert(task, before: oldTask))
      }
    }

    return moves
  }
}
