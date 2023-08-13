//
//  ListViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import Firebase
import Foundation

// view model for the StoreListView
class StoreListViewModel: ObservableObject {
    @Published public var stores: [Store]
    @Published public var showingAddStoreSheet = false
    @Published public var showingSettingsSheet = false
    @Published public var loggedOff = false
    @Published public var newStoreName = ""
    @Published public var addStoreErrorMsg = ""
    
    private var rootRef: DatabaseReference!
    private let user: User?
    
    init() {
        // init stores array
        stores = []
        
        // get firebase root and populate stores array
        user = Auth.auth().currentUser
        rootRef = Database.database().reference()
        if user == nil {
            return
        }
        populateShoppingLists()
    }
    
    // populate stores array with firebase data
    func populateShoppingLists() {
        rootRef.child(user!.emailWithoutSpecialCharacters).observe(.value) { snapshot in
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

    // adds a store to the users storelist view and updates firebase
    func addStore() {
        if newStoreName == "" {
            addStoreErrorMsg = "Enter name to add new store"
            return
        }
        let newStore = Store(name: newStoreName, items: [])
        
        // update firebase
        let userRef = rootRef.child(user!.emailWithoutSpecialCharacters)
        let shoppingListRef = userRef.child(newStoreName)
        shoppingListRef.setValue(newStore.toDict())
        
        // append store to storelist in memory
        showingAddStoreSheet = false
        newStoreName = ""
    }
    
    // deletes a store from the StoreView and from the firebase db
    func delete(at offsets: IndexSet) {
        // delete store from firebase
        let removingIndex = offsets.first ?? 0
        let removingStore = stores[removingIndex]
        let storeRef = rootRef.child(user!.emailWithoutSpecialCharacters).child(removingStore.name)
        storeRef.removeValue()
        
        // delete store from stores array
        stores.remove(atOffsets: offsets)
    }
    
    // signs the currently signed in user out
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            return false
        }
    }
}
