//
//  CreateAccountView.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/25/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var email : String = ""
    @State private var fullName: String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    
    @EnvironmentObject var authViewModel : AuthViewModel
//    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var router : Router
    
    var isValidPassword:Bool{
        confirmPassword == password
    }
    
    var body: some View {
        VStack(spacing: 16){
            Text("Please complete all information to create an account.")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            
            InputView(
                placeholder: "Email or Phone number", text: $email
            )
            
            InputView(
                placeholder: "Full name", text: $fullName
            )
            
            InputView(
                placeholder: "password", isSecureField: true, text: $password
            )
            
            ZStack(alignment: .trailing){
                InputView(placeholder: "Confirm your password", isSecureField: true, text: $confirmPassword)
                
                Spacer()
                
                if !password.isEmpty && !confirmPassword.isEmpty{
                    Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .foregroundColor(isValidPassword ? .green : .red)
                }
            }
            
            
            Spacer()
            
            Button{
                Task{
                    await authViewModel.createUser(email: email, fullName: fullName, password: password)
                    
                    if !authViewModel.isError{
//                        presentationMode.wrappedValue.dismiss()
                        router.navigateBack()
                    }
                }
                
            } label: {
                Text("Create Account")
            }
            .buttonStyle(CapsuleButtonStyle())
            
        }.navigationTitle("Set up your account")
            .padding()
        
    }
    
    
    
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
            .environmentObject(AuthViewModel()) 
    }
}
