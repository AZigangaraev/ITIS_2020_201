//
//  UsersViewController.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class UsersViewController: UITableViewController {
    
    var onFinish: ((User) -> Void)?
    
    private var cells: [User] = []

    var viewModel: UsersViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Users"
        tableView.tableFooterView = UIView()
        
        viewModel.users = { [unowned self] in
            cells = $0
            tableView.reloadData()
        }
        viewModel.loadData()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        onFinish?(cells[indexPath.row])
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath)
        let user = cells[indexPath.row]
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.status
        return cell
    }

}
