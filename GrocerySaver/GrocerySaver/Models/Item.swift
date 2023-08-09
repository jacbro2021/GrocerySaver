//
//  Item.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    
    init?(_ dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        self.name = name
        
        guard let price = dictionary["price"] as? String else {
            return nil
        }
        self.price = Double(price) ?? 0.00
    }
    
    func toDict() -> [String: Any] {
        return ["name": self.name]
    }
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}
