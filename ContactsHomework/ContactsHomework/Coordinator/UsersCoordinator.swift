//
//  UsersCoordinator.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import UIKit

class UsersCoordinator {
    func startViewController() -> UIViewController {
        UINavigationController(rootViewController: usersViewController())
    }
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private func usersViewController() -> UIViewController {
        let viewController: UsersViewController = storyboard.instantiateViewController(identifier: "UsersViewController")
        let viewModel = UsersViewModelImplementation()
        viewController.onFinish = { [weak viewController] user in
            viewController?.navigationController?.pushViewController(self.detailUserViewController(user: user), animated: true)
        }
        viewController.viewModel = viewModel


        return viewController
    }
    private func detailUserViewController(user: User) -> UIViewController {
        let viewController: DetailUserViewController = storyboard.instantiateViewController(identifier: "DetailUserViewController")
        viewController.onFinish = { [weak viewController] user in
            let postsController = PostsCoordinator().startViewController(user: user)
            viewController?.navigationController?.pushViewController(postsController, animated: true)
        }
        viewController.user = user
        return viewController
    }
}
