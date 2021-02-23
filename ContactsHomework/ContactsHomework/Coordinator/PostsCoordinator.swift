//
//  PostsCoordinator.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class PostsCoordinator {
    func startViewController(user: User) -> UIViewController {
        postsViewController(user: user)
    }
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private func postsViewController(user: User) -> UIViewController {
        let viewController: PostsViewController = storyboard.instantiateViewController(identifier: "PostsViewController")
        let viewModel = PostViewModelImplementation()
        viewModel.username = user.username
        viewController.viewModel = viewModel


        return viewController
    }
}
