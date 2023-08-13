//
//  UserExtension.swift
//  GrocerySaver
//
//  Created by jacob brown on 8/13/23.
//

import Foundation
import Firebase

extension User {
    
    var emailWithoutSpecialCharacters: String {
        guard let email = self.email else {
            fatalError("Unable to access user email.")
        }
        
        return email.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
}
