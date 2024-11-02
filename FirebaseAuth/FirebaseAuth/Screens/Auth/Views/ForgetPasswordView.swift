//
//  ForgetPasswordView.swift
//  FirebaseAuth-fo
//
//  Created by Shafiq  Ullah on 11/1/24.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State private var email : String = ""
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var router : Router
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading, spacing: 8){
                Text("Reset Password")
                    .font(.largeTitle)
                
                Text("Enter the email assosiated with your account and we'll send an email with instruction to reset your password")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }.padding(.bottom, 32)
            
            
            InputView(placeholder: "Enter your email", text: $email)
                .padding(.bottom, 16)
            
            Button{
                Task{
                    await authViewModel.resetPassword(by: email)
                    if !authViewModel.isError{
                        router.navigation(to: .emailSend)
                    }
                }
                                
            }label: {
                Text("Send Instruction")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            
            
            Spacer()
            
            
            
            
        }
        .padding()
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Help"){
                    // Action
                }
            }
        }
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
