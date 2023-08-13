//
//  Item.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

// class to represent each grocery item
struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    
    // initializes the item using a dictionary (format returned by firebase)
    init?(_ dictionary: [String: Any]) {
        // retrieves the name field
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        self.name = name
        
        // retrieves the price field
        guard let price = dictionary["price"] as? Double else {
            return nil
        }
        self.price = price
    }
    
    // converts item to a dictionary so that the item can be updated within firebase
    func toDict() -> [String: Any] {
        return ["name": name, "price": price]
    }
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}
