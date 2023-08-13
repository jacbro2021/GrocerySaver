//
//  UserExtension.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/13/23.
//

import Firebase
import Foundation

// used when working with the database to create nodes to hold data for each user
extension User {
    var emailWithoutSpecialCharacters: String {
        guard let email = email else {
            fatalError("Unable to access user email.")
        }

        return email.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
}
