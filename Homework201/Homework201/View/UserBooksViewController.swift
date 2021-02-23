//
//  UserBooksViewController.swift
//  Homework201
//
//  Created by Robert Mukhtarov on 23.02.2021.
//

import UIKit

protocol UserBooksView: AnyObject {
    func set(books: [Book])
    func showTableView()
    func requireSignIn()
}

class UserBooksViewController: UIViewController, UserBooksView, UITableViewDelegate, UITableViewDataSource {
    var presenter: UserBooksViewControllerPresenter?
    
    private var books: [Book] = []
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var signInRequiredView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.onViewWillAppear()
    }
    
    // MARK: - UserBooksView
    
    func set(books: [Book]) {
        self.books = books
        tableView.reloadData()
    }
    
    func requireSignIn() {
        signInRequiredView.isHidden = false
        tableView.isHidden = true
        navigationItem.rightBarButtonItem = nil
    }
    
    func showTableView() {
        signInRequiredView.isHidden = true
        tableView.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOutPressed))
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        presenter?.onSignInPressed?()
    }
    
    @objc func signOutPressed() {
        presenter?.signOut()
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserBookCell", for: indexPath) as? UserBookCell else {
            fatalError("Could not dequeue cell")
        }
        cell.book = books[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.onBookSelected?(books[indexPath.row])
    }
}

// MARK: - UserBookCell

class UserBookCell: UITableViewCell {
    var book: Book? {
        didSet {
            guard let book = book else { return }
            textLabel?.text = book.title
            detailTextLabel?.text = book.author
        }
    }
}
