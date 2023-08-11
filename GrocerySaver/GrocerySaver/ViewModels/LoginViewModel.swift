//
//  LoginViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/16/23.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isValid = false
    @Published var errorMsg = ""
    
    func validateCredentials() {
        if (email == "" || password == "") {
            errorMsg = "Invalid username or password."
            return
        }
        //add firebase code here
        
        
        isValid = true
    }
}
