//
//  MainCoordinator.swift
//  Weather
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class MainCoordinator {
    var onFinish: (() -> Void)?
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func startViewController() -> UIViewController {
        mainController()
    }
    
    private func mainController() -> UIViewController{
        let viewController: MainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        let addCityViewController: AddCityViewController = storyboard.instantiateViewController(identifier: "AddCityViewController")
        viewController.onFinishAdd = { [weak viewController] in
            viewController?.navigationController?.pushViewController(addCityViewController, animated: true)
        }
        let weatherViewController: WeatherViewController = storyboard.instantiateViewController(identifier: "WeatherViewController")
        viewController.onFinishWeather = { [weak viewController] in
            viewController?.navigationController?.pushViewController(weatherViewController, animated: true)
        }
        return viewController
    }
    
    
    
}
