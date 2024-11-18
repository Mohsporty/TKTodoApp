//
//  ContentView.swift
//  TKTodoApp
//
//  Created by Mohammad  on 11/11/2024.
//

import SwiftUI

struct MainView: View {
    
    
    @StateObject private var viewModel = MainViewModel()
    
    
    var body: some View {
        if viewModel.IsSignIn, !viewModel.currentUserId.isEmpty{
            ProfileView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
