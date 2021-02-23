//
//  TableViewCellViewModel.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    private var profile: Profile
    var name: String {
        return profile.name
    }
    
    var phone: String {
        return profile.phone
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
