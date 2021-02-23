//
//  DetailViewModel.swift
//  Mvvm
//
//  Created by Nail on 21.02.2021.
//  Copyright © 2021 Nail. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    var phone: String {
        return profile.phone
    }
    
    private var profile: Profile
    var description: String {
        return profile.name
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
