//
//  groceryList.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/25/23.
//

import Foundation

struct GroceryList: Identifiable {
    let id = UUID()
    let items: [Item]
    let note: String
    
    var size: Int {
        return items.count
    }
    
    var totalCost: Double {
        var total = 0.0
        for item in items {
            total += item.price
        }
        
        return total
    }
}
