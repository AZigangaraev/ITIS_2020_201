//
//  Users.swift
//  Crypto
//
//  Created by Рустем on 23.02.2021.
//

import Foundation


struct User {
    let id = UUID()
    let name: String
    let FirstName: String
    let password: String
    var purse: [Purse]
}
