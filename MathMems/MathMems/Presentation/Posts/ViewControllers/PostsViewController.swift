//
//  PostsViewController.swift
//  MathMems
//
//  Created by Никита Ляпустин on 22.02.2021.
//

import UIKit

protocol PostsViewControllerPresenter {
    func likeTapped(post: Post)
    func loadData()
}

class PostsViewController: UIViewController, UITableViewDataSource {

    var presenter: PostsViewControllerPresenter?
    private var posts: [Post] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func set(comingPosts: [Post]) {
        posts = comingPosts
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            fatalError("Could not dequeue cell")
        }
        cell.awakeFromNib()
        let post = posts[indexPath.row]
        cell.post = post
        cell.likeTap = { [unowned self] in
            presenter?.likeTapped(post: post)
        }
        return cell
    }
}
