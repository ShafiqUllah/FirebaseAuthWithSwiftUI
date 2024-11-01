//
//  AuthViewModel.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/28/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@MainActor
final class AuthViewModel: ObservableObject{
    
    @Published var session : FirebaseAuth.User? // firebasse used
    @Published var currentUser : User? // my app user
    @Published var isError: Bool = false

    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        Task{
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async{
        if let user = auth.currentUser{
            session = user
            await fetchUser(by: user.uid)
        }
    }
    
    func login(email:String, password:String) async{
        do{
            let authResult = try await auth.signIn(withEmail: email, password: password)
            session = authResult.user
            
            await fetchUser(by: authResult.user.uid)

//            print("current user", currentUser)
        } catch{
            isError = true
        }
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
    
    func fetchUser(by uid: String) async{
        do{
            let document = try await firestore.collection("users").document(uid).getDocument()
            if let data = document.data() {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                currentUser = try JSONDecoder().decode(User.self, from: jsonData)
            }else{
                isError = true
            }
            
        }catch{
            isError = true
        }
    }
    
    func signOut(){
        do{
            session = nil
            currentUser = nil
            try auth.signOut()
        }catch{
            isError = true
        }
    }
    
    func deleteAccout() async{
        do{
            session = nil
            currentUser = nil
            
            deleteUser(by: auth.currentUser?.uid ?? "")
            
            try await auth.currentUser?.delete()
        }catch{
            isError = true
        }
    }
    
    
    private func deleteUser(by uid: String){
        firestore.collection("users").document(uid).delete()
    }
    
    
    
}
