//
//  MainViewModel.swift
//  TKTodoApp
//
//  Created by Mohammad  on 18/11/2024.
//

import Foundation
import FirebaseAuth


class MainViewModel: ObservableObject{
    
    @Published var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    public var IsSignIn: Bool {
        return   Auth.auth().currentUser != nil
    }
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener ({ [weak self]_, user in
          
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
            
        })
        
        
    }
}



