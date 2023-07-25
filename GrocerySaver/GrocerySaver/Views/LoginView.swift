//
//  LoginView.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/16/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var _vm = LoginViewModel()
    @State private var _errorMsg = ""
    
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
                        _vm.validateCredentials()
                    } label: {
                        Text("Sign In")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 75)
                            .padding(.vertical, 15)
                    }   .background(.green)
                        .cornerRadius(10)
                        .padding(.top, 15)
                }
                
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Sign Up")
                }.padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: StoreListView(), isActive: $_vm.isValid) {
                                EmptyView()
                }
            }.navigationTitle("Grocery Saver")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
