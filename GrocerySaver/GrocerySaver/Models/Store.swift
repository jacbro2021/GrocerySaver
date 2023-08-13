//
//  Store.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

// type alias for the format of data returned by firebase
typealias JSONDictionary = [String: Any]

// struct to hold the grocery list data for each store
struct Store: Identifiable {
    let id = UUID()
    let name: String
    var items: [Item] = []
    
    init(name: String, items: [Item]) {
        self.name = name
        self.items = items
    }
    
    // initializes the store using a dictionary (format return by firebase)
    init?(_ dictionary: [String: Any]) {
        // retrieves the name field from the dict
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        self.name = name
        
        // retrieves the items array from the dictionary
        let itemsDictionary = dictionary["items"] as? [JSONDictionary]
        if let itemsDict = itemsDictionary {
            self.items = itemsDict.compactMap(Item.init)
        }
    }
    
    // num of items
    var itemCount: Int {
        return self.items.count
    }
    
    // convert store to dictionary
    func toDict() -> [String: Any] {
        return ["name": self.name, "items": self.items.map { item in
            item.toDict()
        }]
    }
}
