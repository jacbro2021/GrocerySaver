//
//  LoginViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/16/23.
//

import Firebase
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isValid = false
    @Published var errorMsg = ""

    func validateCredentials() {
        if email == "" || password == "" {
            errorMsg = "Invalid username or password."
            return
        }
        
        //login to firebase
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let err = error {
                self.errorMsg = err.localizedDescription
                return
            } else {
                self.isValid = true
            }
        }
    }
}
