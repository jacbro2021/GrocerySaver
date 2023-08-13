//
//  StoreViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Firebase
import Foundation

// view model for the StoreView
class StoreViewModel: ObservableObject {
    @Published public var store: Store
    @Published public var items: [Item]
    @Published public var showingSheet = false
    @Published public var newItemName = ""
    @Published public var newItemPrice = "0.00"
    @Published public var newItemErrorMsg = ""
    
    private var rootRef: DatabaseReference!
    private let user: User?
    
    init(_ store: Store) {
        self.store = store
        items = store.items
        
        // firebase
        user = Auth.auth().currentUser
        if user == nil {
            return
        }
        rootRef = Database.database().reference()
    }
    
    // adds an item to the store
    func addItem() {
        if newItemName == "" {
            newItemErrorMsg = "New Item must have a name"
            return
        }
        
        // add item to array in memory
        let newItem = Item(name: newItemName, price: Double(newItemPrice)!)
        store.items.append(newItem)
        items = store.items
        
        // add item to firebase
        let shoppingListRef = rootRef.child(user!.emailWithoutSpecialCharacters).child(store.name)
        shoppingListRef.setValue(store.toDict())
        
        showingSheet = false
        newItemName = ""
        newItemPrice = "0.00"
        newItemErrorMsg = ""
    }
    
    // deletes an item from the store
    func delete(at offsets: IndexSet) {
        // delete item from store in memory
        store.items.remove(atOffsets: offsets)
        items = store.items
        
        // update firebase to delete item
        let shoppingListRef = rootRef.child(user!.emailWithoutSpecialCharacters).child(store.name)
        shoppingListRef.setValue(store.toDict())
    }
}
