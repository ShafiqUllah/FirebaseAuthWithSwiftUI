//
//  EmailSendView.swift
//  FirebaseAuth-fo
//
//  Created by Shafiq  Ullah on 11/1/24.
//

import SwiftUI

struct EmailSendView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 24){
                Spacer()
                
                Image(systemName: "envelope.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.teal)
                
                VStack(spacing: 8){
                    Text("Check your email")
                        .font(.largeTitle.bold())
                    
                    Text("We have send a password recovery instructions to your emial")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                
                Button{
                    
                } label: {
                    Text("skip, I'll confirm later")
                }
                .buttonStyle(CapsuleButtonStyle())
                
                Spacer()
                
                Button{
                    
                } label: {
                    (Text("Did not received the email? Check your spam folder, or ")
                        .foregroundColor(.gray)
                    +
                    Text("try anaother email address")
                        .foregroundColor(.teal))
                }
            }
            .padding()
            toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Help"){
                        // Action
                    }
                }
            }
        }
        
    }
}

struct EmailSendView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSendView()
    }
}
