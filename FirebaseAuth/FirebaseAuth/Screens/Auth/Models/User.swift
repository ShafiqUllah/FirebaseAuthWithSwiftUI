//
//  User.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/28/24.
//

import Foundation
import SwiftUI

struct User : Codable{
    let uid: String
    let email: String
    let fullName : String
    
    var initials : String{
        let formatter = PersonNameComponentsFormatter()
        if let component = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: component)
        }
        
        return ""
            
    }
    
    func toDictionary() -> [String: Any] {
            return [
                "uid": uid, 
                "email": email,
                "fullName": fullName
            ]
        }
}
