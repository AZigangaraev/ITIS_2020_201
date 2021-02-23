//
//  TwitterDataService.swift
//  Twitter
//
//  Created by Teacher on 09.02.2021.
//

import Foundation

class MockTwitterDataService: TwitterDataService {
    var tweets: [Tweet] = [
        Tweet(username: "User 1", text: "Hello world 1", likes: 42),
        Tweet(username: "User 2", text: "Hello world 2", likes: 44),
        Tweet(username: "User 3", text: "Hello world 3", likes: 4),
        Tweet(username: "User 4", text: "Hello world 4", likes: 2),
        Tweet(username: "User 5", text: "Hello world 5", likes: 0),
    ]

    func retweet(tweet: Tweet, completion: @escaping (Result<Tweet, TwitterError>) -> Void) {
        let result = Tweet(username: "admin", text: tweet.text, likes: 0)
        tweets.insert(result, at: 0)
        completion(.success(result))
    }

    func like(tweet: Tweet, completion: @escaping (Result<Tweet, TwitterError>) -> Void) {
        if let index = tweets.firstIndex(where: { $0.id == tweet.id }) {
            let result = Tweet(username: tweet.username, text: tweet.text, likes: tweet.likes + 1)
            tweets[index] = result
            completion(.success(result))
        } else {
            completion(.failure(.tweetNotFound))
        }
    }
}
