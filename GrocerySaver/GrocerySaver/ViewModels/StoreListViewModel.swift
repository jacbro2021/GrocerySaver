//
//  ListViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Foundation

class StoreListViewModel: ObservableObject {
    @Published public var stores: [Store]
    @Published public var showingSheet = false
    @Published public var newStoreName = ""
    @Published public var addStoreErrorMsg = ""
    
    init() {
        //test Data
        stores = [Store(name: "Walmart", items: [Item(name: "Apple", price: 1.05), Item(name: "Kiwi", price: 0.99)]),
                  Store(name: "Target", items: [Item(name: "Shirt", price: 2.25), Item(name: "Shampoo", price: 3.00)])]
    }

    func addStore() {
        if newStoreName == "" {
            addStoreErrorMsg = "Enter name to add new store"
            return
        }
        
        //add firebase code here
        
        stores.append(Store(name: newStoreName, items: []))
        showingSheet = false
        newStoreName = ""
    }
    
    func delete(at offsets: IndexSet) {
        stores.remove(atOffsets: offsets)
        
        //add firebase code here
    }
}
