//
//  PostViewModel.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import Foundation


protocol PostViewModel {
    var posts: (([Post]) -> Void)? { get set }

    func loadData()
    func like(post: Post)
}

class PostViewModelImplementation: PostViewModel {
    var username: String?
    
    var onFinish: (() -> Void)?

    private let postService: PostDataService = PostDataService()
    private var cachedPosts: [Post] = []
    var posts: (([Post]) -> Void)?

    func loadData() {
        cachedPosts = postService.posts
        posts?(cachedPosts)
    }

    func like(post: Post) {
        postService.like(post: post) { [weak self] result in
            switch result {
                case .success:
                    self?.updatePosts()
                case .failure(let error):
                    print(error)
            }
        }
    }

    private func updatePosts() {
        cachedPosts = postService.posts
        posts?(cachedPosts)
    }
}
