//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Teacher on 09.02.2021.
//

import UIKit

class TwitterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!

    private var cells: [Tweet] = []

    private let twitterService = TwitterDataService()

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
    }

    private func reloadData() {
        cells = twitterService.tweets
        tableView.reloadData()
    }

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
            twitterService.like(tweet: tweet) { [weak self] result in
                switch result {
                    case .success:
                        self?.reloadData()
                    case .failure(let error):
                        print(error)
                }
            }
        }
        cell.retweetTap = { [unowned self] in
            twitterService.retweet(tweet: tweet) { [weak self] result in
                switch result {
                    case .success:
                        self?.reloadData()
                    case .failure(let error):
                        print(error)
                }
            }
        }
        return cell
    }
}
