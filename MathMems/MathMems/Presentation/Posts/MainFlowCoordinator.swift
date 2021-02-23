//
//  PostsCoordinator.swift
//  MathMems
//
//  Created by Никита Ляпустин on 23.02.2021.
//

import UIKit

public class MainFlowCoordinator {
    
    func startMainFlow() -> UIViewController{
        return postsViewController()
    }
    
    private func postsViewController() -> UIViewController {
        let presenter = PostsPresenter()
        let controller = presenter.viewController()
        
        return controller
    }
}
