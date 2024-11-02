//
//  Router.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/25/24.
//

import SwiftUI

final class Router : ObservableObject{
    
    @Published var navPath = NavigationPath()
    
    enum AuthFLow: Hashable, Codable{
        case loging
        case createAccount
        case profile
        case forgotPassword
        case emailSend
    }
    
    func navigation(to destination: AuthFLow){
        
    }
    
    func navigateBack(){
        navPath.removeLast()
    }
    
    func navigateToRoot(){
        navPath.removeLast(navPath.count)
    }
    
    
}

