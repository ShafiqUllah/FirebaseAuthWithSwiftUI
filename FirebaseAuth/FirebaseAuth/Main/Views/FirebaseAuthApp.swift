//
//  FirebaseAuthApp.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/22/24.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}


@main
struct FirebaseAuthApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject private var authViewModel = AuthViewModel()
    @ObservedObject private var router =  Router()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationStack(path: $router.navPath){ // from iOS 16
                
                ContentView()
                    .navigationDestination(for: Router.AuthFLow.self){ destination in
                        switch destination{
                        case .loging : LoginView()
                        case .createAccount: CreateAccountView()
                        case .profile: ProfileView()
                        case .forgetPassword : ForgetPasswordView()
                        case .emailSend: EmailSendView()
                        }
                    }
            }
            .environmentObject(authViewModel)
            .environmentObject(router)
        }
    }
}
