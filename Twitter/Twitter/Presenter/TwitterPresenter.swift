//
//  TwitterPresenter.swift
//  Twitter
//
//  Created by Teacher on 09.02.2021.
//

import UIKit

class TwitterPresenter: TwitterViewControllerPresenter {
    private let twitterService: TwitterDataService = TwitterDataService()
    private weak var view: TwitterView!

    func loadData() {
        view.set(tweets: twitterService.tweets)
    }

    func retweet(tweet: Tweet) {
        twitterService.retweet(tweet: tweet) { [weak self] result in
            guard let self = self else { return }

            switch result {
                case .success:
                    self.view.set(tweets: self.twitterService.tweets)
                case .failure(let error):
                    print(error)
            }
        }
    }

    func like(tweet: Tweet) {
        twitterService.like(tweet: tweet) { [weak self] result in
            guard let self = self else { return }

            switch result {
                case .success:
                    self.view.set(tweets: self.twitterService.tweets)
                case .failure(let error):
                    print(error)
            }
        }
    }

    func start(in navigationController: UINavigationController) {
        navigationController.pushViewController(viewController(), animated: true)
    }

    private func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: TwitterViewController = storyboard.instantiateViewController(identifier: "TwitterViewController")
        controller.presenter = self
        view = controller
        return controller
    }
}
