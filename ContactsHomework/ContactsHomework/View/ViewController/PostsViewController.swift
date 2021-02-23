//
//  PostsViewController.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class PostsViewController: UITableViewController {
    
    private var cells: [Post] = []

    var viewModel: PostViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Posts"
        tableView.tableFooterView = UIView()
        
        viewModel.posts = { [unowned self] in
            cells = $0
            tableView.reloadData()
        }
        viewModel.loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as? PostCell else {
            fatalError("Could not dequeue cell")
        }
        let post = cells[indexPath.row]
        cell.post = post
        cell.like = { [unowned self] in
            viewModel.like(post: post)
        }
        return cell
    }


}
