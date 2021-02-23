//
//  TasksViewController.swift
//  ContactAppMVVM
//
//  Created by Rishat on 22.02.2021.
//

import UIKit

final class TasksViewController: UITableViewController {
    
  func logOut() {
        onFinish?()
  }
    
  var onFinish: (() -> Void)?
    
  private class DataSource: UITableViewDiffableDataSource<Section, Task> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      true
    }
  }

  private enum Section {
    case tasks
  }

  private var dataSource: UITableViewDiffableDataSource<Section, Task>!
  private let decoder = JSONDecoder()
  private let encoder = JSONEncoder()
  private let url = try! FileManager.default
    .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    .appendingPathComponent("tasks.json", isDirectory: false)
  private var taskList: TaskList!

  required init?(coder: NSCoder) {
    super.init(coder: coder)

    do {
      let data = try Data(contentsOf: url)
      let tasks = try decoder.decode([Task].self, from: data)
      taskList = TaskList(tasks: tasks)
    } catch {
      taskList = TaskList()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    dataSource = DataSource(tableView: tableView) { tableView, indexPath, item in
      let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath)
      cell.textLabel?.text = item.title
      return cell
    }
    tableView.dragInteractionEnabled = true
    tableView.dragDelegate = self
    tableView.dropDelegate = self
  }

  func updateView() {
    let oldTasks = dataSource.snapshot().itemIdentifiers
    guard !taskList.tasks.difference(from: oldTasks).isEmpty else { return }

    var snapshot = NSDiffableDataSourceSnapshot<Section, Task>()
    snapshot.appendSections([.tasks])
    snapshot.appendItems(taskList.tasks)
    dataSource.apply(snapshot, animatingDifferences: view.window != nil)

    do {
      let data = try encoder.encode(taskList.tasks)
      try data.write(to: url)
    } catch {
        fatalError("Error")
    }
  }

  @IBAction func newTask(_ sender: Any?) {
    let alert = UIAlertController(
      title: "New Task",
      message: nil,
      preferredStyle: .alert
    )

    alert.addTextField { textField in
      textField.autocapitalizationType = .sentences
      textField.enablesReturnKeyAutomatically = true
      textField.returnKeyType = .done
    }

    let save = UIAlertAction(title: "Save", style: .default) { [weak alert] _ in
      guard let textField = alert?.textFields?.first else { return }
      self.saveNewTask(textField)
    }
    alert.addAction(save)

    let cancel = UIAlertAction(title: "Cancel", style: .cancel)
    alert.addAction(cancel)

    present(alert, animated: true)
  }

  @objc func saveNewTask(_ textField: UITextField) {
    guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
      !text.isEmpty
      else { return }

    let task = taskList.appendNew(title: text)
    var snapshot = dataSource.snapshot()
    if snapshot.sectionIdentifiers.isEmpty {
      snapshot.appendSections([.tasks])
    }
    snapshot.appendItems([task])
    dataSource.apply(snapshot)
  }
}

extension TasksViewController {
  func move<Tasks: Collection>(_ tasks: Tasks, to indexPath: IndexPath) where Tasks.Element == Task {
    if let moves = taskList.move(tasks, to: indexPath.row) {
      var snapshot = dataSource.snapshot()
      for move in moves {
        switch move {
        case let .append(task, after: otherTask):
          snapshot.moveItem(task, afterItem: otherTask)
        case let .insert(task, before: otherTask):
          snapshot.moveItem(task, beforeItem: otherTask)
        }
      }
      dataSource.apply(snapshot)
    }
  }
}

extension TasksViewController: UITableViewDragDelegate {
  func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
    true
  }

  func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    [taskDragItem(at: indexPath)]
  }

  func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
    [taskDragItem(at: indexPath)]
  }

  private func taskDragItem(at indexPath: IndexPath) -> UIDragItem {
    let task = taskList.tasks[indexPath.row]
    let item = UIDragItem(itemProvider: NSItemProvider())
    item.localObject = task
    return item
  }
}

extension TasksViewController: UITableViewDropDelegate {
  func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
    guard tableView.hasActiveDrag else {
      return UITableViewDropProposal(operation: .cancel)
    }

    if session.items.count > 1 {
      return UITableViewDropProposal(operation: .move, intent: .unspecified)
    } else {
      return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
  }

  func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
    guard let indexPath = coordinator.destinationIndexPath else { return }
    let items = coordinator.session.items
    let tasks = items.map { $0.localObject as! Task }
    move(tasks, to: indexPath)
  }
    
  private func finish() {
        onFinish?()
  }
}
