//
//  ViewController.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ReloadTableViewDelegate {
    
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var phoneNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var viewModel: ContactViewModel!
    
    func logOut() {
        onFinish?()
    }
    
    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ContactViewModel(viewDelegate: self)
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: "itemCell")
        itemTableView.dataSource = self
        itemTableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "log out", style: .plain, target: self, action: #selector(logOutTap))
    }

    @IBAction func AddItemAction(_ sender: UIButton) {
        viewModel?.onItemAddClick(phoneName: phoneNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "itemCell") as! ContactCell
        cell.setupDataFromModel(model: viewModel!.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tasksViewController: TasksViewController = storyboard?.instantiateViewController(identifier: "TasksViewController") as! TasksViewController
        navigationController?.pushViewController(tasksViewController, animated: true)
    }
    
    func reloadTableView(index: Int) {
        phoneNameTextField.text = ""
        phoneNumberTextField.text = ""
        itemTableView.beginUpdates()
        itemTableView.insertRows(at: [IndexPath(row: index - 1,section: 0)], with: .automatic)
        itemTableView.endUpdates()
        let alert = UIAlertController(title: "", message: "Contact added", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func logOutTap() {
        logOut()
    }
}

