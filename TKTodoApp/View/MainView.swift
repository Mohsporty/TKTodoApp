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
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoView()
                .tabItem {
                    Image(systemName: "checkmark")
                }
            CalanderView()
                .tabItem {
                    Image(systemName: "calendar")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
