//
//  PostDataService.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import Foundation

enum PostDataError: Error {
    case postNotFound
    case noUserPosts
}

class PostDataService {
    var posts: [Post] = [
        Post(text: "AAAAA", likes: 100, author: "ruslan"),
        Post(text: "AAAAA", likes: 100, author: "ruslan"),
        Post(text: "AAAAA", likes: 100, author: "ruslan"),
        Post(text: "BBB", likes: 200, author: "admin"),
        Post(text: "BBB", likes: 200, author: "admin"),
        Post(text: "BBB", likes: 200, author: "admin"),
        Post(text: "AAAAA", likes: 600, author: "sveta")
    ]
    
    func like(post: Post, completion: @escaping (Result<Post, PostDataError>) -> Void) {
        if let index = posts.firstIndex(where: {$0.id == post.id}) {
            let result = Post(text: post.text, likes: post.likes + 1, author: post.author)
            posts[index] = result
            completion(.success(result))
        } else {
            completion(.failure(.postNotFound))
        }
    }
    
    func getPostsCreated(by username: String, completion: @escaping (Result<[Post], PostDataError>) -> Void) {
        let result = posts.filter{ $0.author == username }
        if result.count != 0 {
            completion(.success(result))
        } else {
            completion(.failure(.noUserPosts))
        }
    }
}
