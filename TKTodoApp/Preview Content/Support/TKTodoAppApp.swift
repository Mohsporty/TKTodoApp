//
//  TKTodoAppApp.swift
//  TKTodoApp
//
//  Created by Mohammad  on 11/11/2024.
//

import SwiftUI
import FirebaseCore


@main
struct TKTodoAppApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
