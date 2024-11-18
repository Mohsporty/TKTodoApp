//
//  ProfileView.swift
//  TKTodoApp
//
//  Created by Mohammad  on 18/11/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.customPinkColor.opacity(0.2).ignoresSafeArea(edges: .all)
            
            if let user = viewModel.user {
                profileLoginView(user: user)
            } else {
                Text("Loading User..")
            }
        }
    }
    
    @ViewBuilder
    func profileLoginView(user: TKUser) -> some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .padding(.horizontal,10)
                
                VStack {
                    Text(user.name)
                        .bold()
                        .font(.title)
                    
                    Text(user.email)
                        .bold()
                        .font(.title2)
                    
                    Text("Date of Joining: \(Date(timeIntervalSince1970: user.joined))")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.top,50)
            
            Spacer()
            
            Button {
                viewModel.signOut()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 300, height: 50)
                    
                    Text("Sign out")
                        .font(.title3)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
