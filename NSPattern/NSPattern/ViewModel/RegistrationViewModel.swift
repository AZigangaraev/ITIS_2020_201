//
//  RegistrationViewModel.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import Foundation

protocol RegistrationViewModel {
    func saveData(username: String, password: String)
}

class HardCodeRegistrationViewModel: RegistrationViewModel {
    
    var regService : RegistrationService?
    
    var onFinish: (() -> Void)?
    
    func saveData(username: String, password: String) {
        regService?.saveData(username: username, password: password)
        onFinish?()
    }
    
}
