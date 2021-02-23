//
//  TableViewModel.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import Foundation

protocol TableViewModel {
    var numbersOfRows: Int {get}
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType
    
    func selectRow(atIndexPath indexPath: IndexPath)
    func viewModelForRow() -> DetailViewModelType?

}
