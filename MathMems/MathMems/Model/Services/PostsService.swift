//
//  PostService.swift
//  MathMems
//
//  Created by Никита Ляпустин on 22.02.2021.
//

import UIKit

enum PostsError: Error {
    case postNotFound
}

class PostsService {
    var posts: [Post] = [Post(image: #imageLiteral(resourceName: "mem2"), likes: 13),
                         Post(image: #imageLiteral(resourceName: "mem1"), likes: 11),
                         Post(image: #imageLiteral(resourceName: "mem4"), likes: 106),
                         Post(image: #imageLiteral(resourceName: "mem3"), likes: 23)]
    
    func like(post: Post, completion: @escaping ((Result<Post, PostsError>) -> Void)) {
        if let index = posts.firstIndex(where: {$0.id == post.id}) {
            let result = Post(image: post.image, likes: post.likes + 1)
            posts[index] = result
            return completion((.success(result)))
        } else {
            return completion(.failure(.postNotFound))
        }
    }
}
