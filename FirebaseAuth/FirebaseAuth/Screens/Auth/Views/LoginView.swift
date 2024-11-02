//
//  LoginView.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/22/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var router : Router
    
    var body: some View {
            ScrollView{
                VStack(spacing : 16){
                    // logo
                    Image("login_image")
                        .resizable()
                        .scaledToFit()
                    
                    
                    // title
                    Text("Let's Connect With US!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer().frame(height: 12)
                    
                    // text field
                    InputView(placeholder: "Email or Phone number", text: $email)
                    InputView(placeholder: "Password", isSecureField: true, text: $password)
                    
                    // forgot button
                    forgetButtonView
                    
                    // login button
                    loginButtonView
                    
                    // bottom view
                    bottomView
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical, 0)
            .alert("Something Went Worng", isPresented: $authViewModel.isError, actions: {
                // No action
            })
        
        
    }
    
    
    
    
    private var line : some View {
        VStack{
            Divider().frame(height: 1)
        }
    }
    
    private var loginButtonView: some View{
        
        Button{
            Task{
                await authViewModel.login(email: email, password: password)
            }
        }label: {
            Text("Login")
            
            
        }.buttonStyle(CapsuleButtonStyle())
        
    }
    
    private var forgetButtonView: some View{
        
        HStack{
            Spacer()
            
            Button{
                router.navigation(to: .forgotPassword)
            } label: {
                Text("Forget Password?")
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .font(.subheadline)
            }
            
//            NavigationLink{
//                ForgetPasswordView()
//                    .environmentObject(authViewModel)
//            }label: {
//                
//                
//            }
        }
    }
    
    private var lineOrView: some View{
        HStack(spacing : 16){
            line
            Text("or")
                .fontWeight(.semibold)
            line
        }
        .foregroundColor(.gray)
    }
    
    private var appleButton: some View{
        Button{
            
        }label: {
            Label("Sign up with Apple", systemImage: "applelogo")
            
        }.buttonStyle(CapsuleButtonStyle(bgColor : .black))
    }
    
    private var gooleButton: some View{
        Button{
            
        }label: {
            HStack{
                Image("google")
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("Sign up with Google")
            }
        }.buttonStyle(CapsuleButtonStyle(bgColor: .clear, textColor: .black ,hasBoarder: true))
    }
    
    private var foorterView: some View{
        
        Button{
            router.navigation(to: .createAccount)
        } label: {
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(.black)
                Text("Sign Up")
                    .foregroundStyle(.teal)
            }
        }
        
//        NavigationLink{
//            CreateAccountView()
//                .environmentObject(authViewModel)
//        } label: {
//            
//        }
    }
    
    private var bottomView: some View{
        VStack(spacing: 16){
            lineOrView
            appleButton
            gooleButton
            foorterView
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}


