//
//  StoreView.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import SwiftUI

struct StoreView: View {
    @ObservedObject var vm: StoreViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(vm.items) { item in
                        HStack {
                            Text(item.name)
                            
                            Spacer()
                            
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                    }   .onDelete(perform: vm.delete)
                }
            }   .listStyle(.insetGrouped)
                .navigationTitle(vm.store.name)
                .toolbar {
                    ToolbarItem {
                        Button {
                            vm.showingSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $vm.showingSheet) {
                    VStack {
                        HStack {
                            Text("Add Item")
                                .font(.title)
                                .bold()
                                .padding(.horizontal)
                                .padding(.top)
                                
                            Spacer()
                        }
                            
                        VStack(alignment: .leading) {
                            Text("Item Name")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .bold()
                            TextField("Item Name", text: $vm.newItemName)
                                .padding(.bottom)
                                .textFieldStyle(.roundedBorder)
                        }   .padding(.horizontal)
                            .padding(.top)
                            
                        VStack(alignment: .leading) {
                            Text("Item Price")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .bold()
                            TextField("Item Price", text: $vm.newItemPrice)
                                .keyboardType(.numberPad)
                                .padding(.bottom)
                                .textFieldStyle(.roundedBorder)
                        }.padding(.horizontal)
                            
                        Text(vm.newItemErrorMsg)
                            .foregroundColor(.red)
                            
                        Button {
                            vm.addItem()
                        } label: {
                            Text("Add Item")
                                .font(.title3)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 75)
                                .padding(.vertical, 15)
                        }.background(.green)
                            .cornerRadius(10)
                            .padding(.top, 15)
                            
                        Spacer()
                    }
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(vm: StoreViewModel(Store(name: "Walmart",
                                           items: [Item(name: "Apple", price: 1.05),
                                                   Item(name: "Blueberry", price: 0.50)])))
    }
}
