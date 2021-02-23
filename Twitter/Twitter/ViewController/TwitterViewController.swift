//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Teacher on 09.02.2021.
//

import UIKit

protocol TwitterView: AnyObject {
    func set(tweets: [Tweet])
}
protocol TwitterViewControllerPresenter {
    func loadData()
    func retweet(tweet: Tweet)
    func like(tweet: Tweet)
}

class TwitterViewController: UIViewController, TwitterView, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    var presenter: TwitterViewControllerPresenter?
    private var cells: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.loadData()
    }

    // MARK: - TwitterView

    func set(tweets: [Tweet]) {
        cells = tweets
        tableView?.reloadData()
    }

    // MARK: - Table view

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TweetCell else {
            fatalError("Could not dequeue cell")
        }
        let tweet = cells[indexPath.row]
        cell.tweet = tweet
        cell.likeTap = { [unowned self] in
            presenter?.like(tweet: tweet)
        }
        cell.retweetTap = { [unowned self] in
            presenter?.retweet(tweet: tweet)
        }
        return cell
    }
}
