//
//  TableViewCoordinator.swift
//  Mvvm
//
//  Created by Nail on 22.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import Foundation
import UIKit

class TableViewCoordinator {
    var onFinish: (() -> Void)?

    func startViewController() -> UIViewController {
        tableController()
    }

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    private func tableController() -> UIViewController {
        let viewController: TableViewController = storyboard.instantiateViewController(identifier: "TableViewController")
        let viewModel = ViewModel()
        viewModel.onFinish = { [weak viewController] in
            viewController?.navigationController?.popToRootViewController(animated: true)
        }
        return viewController
    }
}
