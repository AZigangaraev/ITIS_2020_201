//
//  MemesPresenter.swift
//  MathMems
//
//  Created by Никита Ляпустин on 22.02.2021.
//

import UIKit

class PostsPresenter: PostsViewControllerPresenter {
    
    private var postsService = PostsService()
    private weak var view: PostsViewController!
    
    func likeTapped(post: Post) {
        postsService.like(post: post) { [weak self] result in

            switch result {
                case .success:
                    self?.view.set(comingPosts: self?.postsService.posts ?? [])
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func loadData() {
        view.set(comingPosts: postsService.posts)
    }
    
    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: PostsViewController = storyboard.instantiateViewController(identifier: "PostsViewController")
        controller.presenter = self
        view = controller
        view.loadViewIfNeeded()
        view.tableView.rowHeight = UIScreen.main.bounds.width + 60
        loadData()
        return controller
    }
}
