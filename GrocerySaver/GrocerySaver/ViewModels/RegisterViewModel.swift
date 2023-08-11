//
//  RegisterViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/25/23.
//

import Foundation
import Firebase
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg = ""
    @Published var isValid = false

    func CreateProfile() {
        if email == "" || password == "" {
            errorMsg = "You must set a valid email and password to create a new profile."
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password)
        
        isValid = true
    }
}
