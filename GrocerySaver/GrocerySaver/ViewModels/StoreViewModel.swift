//
//  StoreViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

class StoreViewModel: ObservableObject {
    @Published public var store: Store
    @Published public var items: [Item]
    @Published public var showingSheet = false
    @Published public var newItemName = ""
    @Published public var newItemPrice = "0.00"
    @Published public var newItemErrorMsg = ""
    
    init(_ store: Store) {
        self.store = store
        self.items = store.items
    }
    
    func addItem() {
        if (newItemName == "") {
            newItemErrorMsg = "New Item must have a name"
            return
        }
        
        let newPrice = Double(newItemPrice)!
        
        store.items.append(Item(name: newItemName, price: newPrice))
        items = store.items
        showingSheet = false
        newItemName = ""
        newItemPrice = "0.00"
        newItemErrorMsg = ""
    }
    
    func delete(at offsets: IndexSet) {
        store.items.remove(atOffsets: offsets)
        items = store.items
    }
}
