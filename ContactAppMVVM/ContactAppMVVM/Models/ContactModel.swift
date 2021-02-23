//
//  ContactModel.swift
//  ContactAppMVVM
//
//  Created by Rishat on 21.02.2021.
//

import Foundation

class ContactModel {
    var contactName: String?
    var contactNumber: String?
    
    init(contactNumber: String,contactName: String) {
        self.contactNumber = contactNumber
        self.contactName = contactName
    }
    
    init(dictionnary: NSDictionary) {
        self.contactNumber = dictionnary["contactNumber"] as? String
        self.contactName = dictionnary["contactName"] as? String
    }
    
    public class func modelFromDictionnaryArray(array: NSArray) -> [ContactModel] {
        var items = [ContactModel]()
        for data in array {
            items.append(ContactModel(dictionnary: data as! NSDictionary))
        }
        return items
    }
    
}
