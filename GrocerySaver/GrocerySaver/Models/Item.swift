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
}
