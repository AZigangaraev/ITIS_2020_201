//
//  UsersViewModel.swift
//  ContactsHomework
//
//  Created by Ruslan Khanov on 23.02.2021.
//

import Foundation
 
protocol UsersViewModel {
    var users: (([User]) -> Void)? { get set }
    
    func loadData()
}

class UsersViewModelImplementation: UsersViewModel {
    var onFinish: (() -> Void)?

    private let usersService: UserDataService = UserDataService()
    private var cachedUsers: [User] = []
    var users: (([User]) -> Void)?

    func loadData() {
        cachedUsers = usersService.users
        users?(cachedUsers)
    }
}
