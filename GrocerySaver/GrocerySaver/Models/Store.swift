//
//  Store.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

typealias JSONDictionary = [String: Any]

struct Store: Identifiable {
    let id = UUID()
    let name: String
    var items: [Item] = []
    
    init(name: String, items: [Item]) {
        self.name = name
        self.items = items
    }
    
    init?(_ dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        self.name = name
        
        let itemsDictionary = dictionary["items"] as? [JSONDictionary]
        
        if let dictionary = itemsDictionary {
            self.items = dictionary.compactMap(Item.init)
        }
    }
    
    // num of items
    var itemCount: Int {
        return self.items.count
    }
    
    //convert store to dictionary
    func toDict() -> [String: Any] {
        return ["name": self.name]
    }
}
