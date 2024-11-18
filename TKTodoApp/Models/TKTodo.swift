//
//  TKTodo.swift
//  TKTodoApp
//
//  Created by Mohammad  on 19/11/2024.
//

import Foundation

struct TKToDoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
}
