//
//  ViewModel.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import Foundation

class ViewModel: TableViewModel {

    private var selectedIndexPath: IndexPath?
    var profiles = [
        Profile(name: "name", phone: "8363532535"),
        Profile(name: "name2", phone: "884645334"),
        Profile(name: "name3", phone: "880055353")]
    
    func logOut() {
        onFinish?()
    }

    var onFinish: (() -> Void)?
    
    var numbersOfRows: Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
         
       }
    
    func viewModelForRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
       
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
