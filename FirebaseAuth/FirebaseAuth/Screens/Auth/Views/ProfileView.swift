//
//  ProfileView.swift
//  FirebaseAuth-fo
//
//  Created by Shafiq  Ullah on 10/29/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        VStack{
            Spacer()
            if let currentUser = authViewModel.currentUser{
                
                Text(currentUser.fullName)
                
            }else{
                ProgressView("Please wait")
            }
            Spacer()
            
            Button("Sign out"){
                authViewModel.signOut()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
