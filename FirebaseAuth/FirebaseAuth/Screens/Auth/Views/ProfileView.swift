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
        
        if let user = authViewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 70,height: 70)
                            .background(Color.gray)
                            .clipShape(Circle())
                        
                        VStack(alignment : .leading, spacing: 4){
                            Text(user.fullName)
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Text(user.email)
                                .font(.footnote)
                            
                        }
                    }
                }
                
                Section("Accounts"){
                    Button{
                        authViewModel.signOut()
                    }label: {
                        Label {
                            Text("Sign Out")
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(.red)
                        }
                    }
                    
                    Button{
                        Task{
                            await authViewModel.deleteAccout()
                        }
                    }label: {
                        Label {
                            Text("Delete Account")
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.red)
                        }
                    }
                    
                    
                }
                
            }
        }else{
            ProgressView("Please wait")
        }
        
        
        
        //        VStack{
        //            Spacer()
        //            if let currentUser = authViewModel.currentUser{
        //
        //                Text(currentUser.fullName)
        //
        //            }else{
        //                ProgressView("Please wait")
        //            }
        //            Spacer()
        //
        //            Button("Sign out"){
        //                authViewModel.signOut()
        //            }
        //        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
