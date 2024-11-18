//
//  LoginViewModel.swift
//  TKTodoApp
//
//  Created by Mohammad  on 16/11/2024.
//

import Foundation
import FirebaseAuth



class LoginViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMessage : String = ""
    
    init() {}
    
    
    func Login(){
        guard validate() else { return }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter valid email and password. Fill in all the filds"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Enter a Valid Email"
            return false
        }
        return true
    }
    
}
