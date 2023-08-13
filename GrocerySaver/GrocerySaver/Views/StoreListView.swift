//
//  ListView.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/6/23.
//

import SwiftUI

struct StoreListView: View {
    @ObservedObject var vm: StoreListViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Stores")) {
                        ForEach(vm.stores) { store in
                            NavigationLink {
                                StoreView(vm: StoreViewModel(store))
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(store.name)
                                            .font(.title2)
                                            .bold()
                                        
                                        Text("\(store.itemCount) Items")
                                    }
                                }
                            }
                        }.onDelete(perform: vm.delete)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Grocery Saver")
                        .font(.largeTitle)
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            vm.showingSettingsSheet = true
                        } label: {
                            Image(systemName: "gear")
                        }.foregroundColor(.green)
                        
                        Button {
                            vm.showingAddStoreSheet = true
                        } label: {
                            Image(systemName: "plus")
                        }.foregroundColor(.green)
                    }
                }
            }
            .sheet(isPresented: $vm.showingAddStoreSheet) {
                addStoreSheet
            }
            .sheet(isPresented: $vm.showingSettingsSheet) {
                settingsSheet
            }
            
            NavigationLink(destination: LoginView(), isActive: $vm.loggedOff) {
                EmptyView()
            }
        }.navigationBarBackButtonHidden()
    }
    
    var addStoreSheet: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Add New Store")
                    .padding(.top)
                    .padding(.horizontal)
                    .font(.title)
                    .bold()
                    
                TextField("Store Name", text: $vm.newStoreName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
                
            Text(vm.addStoreErrorMsg)
                .foregroundColor(.red)
                
            Button {
                vm.addStore()
            } label: {
                Text("Add Store")
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
    
    var settingsSheet: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 75)
                    .padding(.vertical, 15)
                    .bold()
                
                Spacer()
            }
            
            Button {
                if vm.signOut() {
                    vm.loggedOff = true
                    vm.showingSettingsSheet = false
                }
            } label: {
                    Text("Sign Out")
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView(vm: StoreListViewModel())
    }
}
