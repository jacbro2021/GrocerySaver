//
//  Store.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

struct Store: Identifiable {
    let id = UUID()
    let name: String
    var items: [Item]
    
    //num of items
    var itemCount: Int {
        return self.items.count
    }
}
