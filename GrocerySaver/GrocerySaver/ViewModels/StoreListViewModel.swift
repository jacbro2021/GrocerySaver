//
//  ListViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Firebase
import Foundation

class StoreListViewModel: ObservableObject {
    @Published public var stores: [Store]
    @Published public var showingSheet = false
    @Published public var newStoreName = ""
    @Published public var addStoreErrorMsg = ""
    private var rootRef: DatabaseReference!
    
    init() {
        // init stores array
        stores = []
        
        // get firebase root and populate stores array
        rootRef = Database.database().reference()
        populateShoppingLists()
    }
    
    // populate stores array with firebase data
    func populateShoppingLists() {
        rootRef.observe(.value) { snapshot in
            self.stores = []
            
            let shoppingListDict = snapshot.value as? [String: Any] ?? [:]
            
            for (key, _) in shoppingListDict {
                if let shoppingListDict = shoppingListDict[key] as? [String: Any] {
                    if let store = Store(shoppingListDict) {
                        self.stores.append(store)
                    }
                }
            }
        }
    }

    func addStore() {
        if newStoreName == "" {
            addStoreErrorMsg = "Enter name to add new store"
            return
        }
        let newStore = Store(name: newStoreName, items: [])
        
        // add firebase code here
        let shoppingListRef = rootRef.child(newStoreName)
        shoppingListRef.setValue(newStore.toDict())
        
        // append store to storelist in memory
        showingSheet = false
        newStoreName = ""
    }
    
    func delete(at offsets: IndexSet) {
        stores.remove(atOffsets: offsets)
        
        // add firebase code here
    }
}
