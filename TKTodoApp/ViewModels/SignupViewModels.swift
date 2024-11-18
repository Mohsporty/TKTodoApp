//
//  SignupViewModels.swift
//  TKTodoApp
//
//  Created by Mohammad  on 16/11/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignupViewModels : ObservableObject{
    
    @Published  var email: String = ""
    @Published  var name: String = ""
    @Published  var password: String = ""
    @Published  var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    
    init(){}
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.creatUser(id: userId)
        }
        
    }
    
    private func creatUser(id : String) {
        
        let newUser = TKUser(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("user")
            .document(id)
            .setData(newUser.asdict())
          
        
    }
    
    
    
    private    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
                !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter valid email and password. Fill in all the filds"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Enter a Valid Email"
            return false
        }
        guard password.count > 6 else {
            errorMessage = "Password should be at least 6 characters"
            return false
        }
        guard password.count > 6 else {
            errorMessage = "Password are not match with confirm password"
            return false
        }
        return true
    }
    
}
