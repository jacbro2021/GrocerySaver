//
//  RegisterView.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/16/23.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject private var _vm = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    TextField("Email", text: $_vm.email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 15)
                    TextField("Password", text: $_vm.password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 15)
                        .padding(.top, 15)
                    Text(_vm.errorMsg)
                        .foregroundColor(.red)
                    Button {
                        _vm.validateNewProfile()
                    } label: {
                        Text("Sign Up")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 75)
                            .padding(.vertical, 15)
                    }   .background(.green)
                        .cornerRadius(10)
                        .padding(.top, 15)
                }
                
                Spacer()
            }.navigationTitle("Create New User")
            
            NavigationLink(destination: StoreListView(), isActive: $_vm.isValid) {
                            EmptyView()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
