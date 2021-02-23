//
//  AuthViewModel.swift
//  NSPattern
//
//  Created by Nikita Sosyuk on 23.02.2021.
//

import Foundation

protocol AuthViewModel {
    func authorize(username: String, password: String)
    func registration()
}

class HardCodeAuthViewModel: AuthViewModel {
    
    var authService: AuthService?
    
    var onSuccesAuth: (() -> Void)?
    var onRegScreen: (() -> Void)?
    
    func authorize(username: String, password: String) {
        authService?.authorize(username: username, password: password) { [weak self] result in
            switch result {
            case .success():
                self?.onSuccesAuth?()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func registration() {
        onRegScreen?()
    }
}


