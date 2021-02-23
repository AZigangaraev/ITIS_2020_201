//
//  ContactViewModel.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
//

import Foundation

protocol ViewModelDelegate {
    func onItemAddClick(phoneName: String,phoneNumber: String)
}

protocol ReloadTableViewDelegate {
    func reloadTableView(index: Int)
}

class ContactViewModel: ViewModelDelegate {
    
    var items = [ContactModel]()
    var reloadDelegate: ReloadTableViewDelegate?
    var item = [["contactNumber":"89872446488","contactName":"Latypov Rishat"],
                ["contactNumber":"89177645760","contactName":"Amirova Milana"],
                ["contactNumber":"88005553535","contactName":"Alba Gangsta"]]
    
    init(viewDelegate: ReloadTableViewDelegate) {
        reloadDelegate = viewDelegate
        self.items = ContactModel.modelFromDictionnaryArray(array: item as NSArray)
    }
    
    init(){}
    
    func onItemAddClick(phoneName: String,phoneNumber: String) {
        items.append(ContactModel(contactNumber: phoneNumber, contactName: phoneName))
        reloadDelegate?.reloadTableView(index: items.count)
    }
}
