//
//  RegisterViewModel.swift
//  GrocerySaver
//
//  Created by jacob brown on 7/25/23.
//

import Firebase
import FirebaseAuth
import Foundation

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

        //create new user in firebase
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let err = error {
                self.errorMsg = err.localizedDescription
                return
            } else {
                self.isValid = true
            }
        }
    }
}
