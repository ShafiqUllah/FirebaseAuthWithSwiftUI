//
//  CapsuleButtonStyle.swift
//  FirebaseAuth
//
//  Created by Shafiq  Ullah on 10/25/24.
//

import SwiftUI

struct CapsuleButtonStyle : ButtonStyle{
    
    var bgColor : Color = .teal
    var textColor : Color = .white
    var hasBoarder : Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .overlay{
                hasBoarder ?
                Capsule().stroke(.gray, lineWidth: 1) : nil
            }
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
        
    }
    
    
    
    
}


