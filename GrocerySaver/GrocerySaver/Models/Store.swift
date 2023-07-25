//
//  Store.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/25/23.
//

import Foundation

struct Store: Identifiable {
    let id = UUID()
    let name: String
    let groceryList: [GroceryList]
    
    var size: Int {
        return groceryList.count
    }
}
