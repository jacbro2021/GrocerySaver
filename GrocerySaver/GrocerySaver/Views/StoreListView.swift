//
//  StoreListView.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/16/23.
//

import SwiftUI

struct StoreListView: View {
    @ObservedObject private var _vm = StoresViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    ForEach(_vm.stores) { store in
                        NavigationLink {
                            // navigate to store specific view here
                        } label: {
                            storeTile(store: store)
                        }
                    }.onDelete(perform: _vm.deleteStore)
                }
            }   .navigationTitle("My Stores")
                .toolbar {
                    HStack {
                        Button {
                            _vm.showSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $_vm.showSheet) {
                    addStore
                }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func storeTile(store: Store) -> some View {
        VStack(alignment: .leading) {
            Text(store.name)
                .font(.title2)
                .bold()
            Text("\(store.size) items")
        }
    }
    
    private var addStore: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Add New Store")
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .font(.title)
                    .bold()
                TextField("Store Name", text:$_vm.newStoreName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 10)
            }
            Text(_vm.sheetErrMsg)
                .foregroundColor(.red)
            Button {
                if _vm.addStore() {
                    _vm.showSheet = false
                }
            } label: {
                Text("Add Store")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 75)
                    .padding(.vertical, 15)
            }   .background(.green)
                .cornerRadius(10)
                .padding(.top, 15)
            Spacer()
        }
    }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView()
    }
}
