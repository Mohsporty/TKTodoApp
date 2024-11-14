//
//  SignupView.swift
//  TKTodoApp
//
//  Created by Mohammad  on 14/11/2024.
//

import SwiftUI

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 10){
            VStack (alignment: .leading, spacing: 8){
                Text("Complet Your Rigstarion")
                    .font(.system(size: 25, weight: .medium))
                Text("You only have asses to this informations ")
            }
            .padding(.top,20)
            .padding()
            // informations name email and password here 
            VStack{
                TKTextField(text: $name, placeholder: "Name", image: "person")
                TKTextField(text: $email, placeholder: "Email", image: "envelope")
                TKTextField(text: $password, placeholder: "Password", image: "lock", isSecure: true)
                TKTextField(text: $confirmPassword , placeholder: "Conforim Password", image: "lock", isSecure: true)
                TKButton(label: "Signup") {
                    
                }
            }
            .padding()
           
        }
    }
}


#Preview {
    SignupView()
}
