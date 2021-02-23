//
//  BooksTableViewController.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 22.02.2021.
//

import UIKit

class BooksTableViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: BooksTableViewModel?
    
    private var books: [Book] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
        viewModel?.booksClosure = { [weak self] in
            self?.books = $0
        }
    }
    
    // на будущее))
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.loadData()
    }
    
    // MARK: -UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.detailBook(book: books[indexPath.row])
    }
    
    // MARK: -UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else {
            fatalError("Could not dequeue cell")
        }
        let book = books[indexPath.row]
        cell.setBookData(book: book)
        return cell
    }
    
}
