//
//  StoresViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/25/23.
//

import Foundation

class StoresViewModel: ObservableObject {
    @Published var stores: [Store] = [Store(name: "Walmart", groceryList: [])]
    @Published var showSheet = false
    @Published var newStoreName = ""
    @Published var sheetErrMsg = ""
    
    func addStore() -> Bool{
        if newStoreName == "" {
            sheetErrMsg = "Store Name required to create new store."
            return false
        }
        
        stores.append(Store(name: newStoreName, groceryList: []))
        newStoreName = ""
        return true
    }
    
    func deleteStore(at offsets: IndexSet) {
            stores.remove(atOffsets: offsets)
    }
}
