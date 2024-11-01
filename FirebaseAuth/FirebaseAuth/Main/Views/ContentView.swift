//
//  ContentView.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        
        Group{
            if authViewModel.session == nil{
                LoginView()
    //                .environmentObject(authViewModel) // send by group
            }else{
                ProfileView()
    //                .environmentObject(authViewModel)  // send by group
            }
        }.environmentObject(authViewModel) // sending the whole group
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
