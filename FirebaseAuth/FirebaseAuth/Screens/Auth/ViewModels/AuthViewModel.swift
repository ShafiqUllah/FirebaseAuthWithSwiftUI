//
//  AuthViewModel.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/28/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



final class AuthViewModel: ObservableObject{
    
    @Published var session : FirebaseAuth.User? // firebasse used
    @Published var user : User? // my app user
    @Published var isError: Bool = false

    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        
    }
    
    func createUser(email: String, fullName: String, password: String) async{
        do{
            // Entry to Auth table
            let authResult = try await auth.createUser(withEmail: email, password: password)
            // Store extra data in firestore
            await storeUserInFireStore(uid: authResult.user.uid, email: email, fullName: fullName)
        }catch{
            isError = true
        }
    }
    
    func storeUserInFireStore(uid: String, email: String, fullName: String) async {
        let user = User(uid: uid, email: email, fullName: fullName)
        do{
            try await firestore.collection("users").document(uid).setData(user.toDictionary())
            
        }catch{
            isError = true
        }
    }
    
    
}
