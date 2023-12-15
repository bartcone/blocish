//
//  TodosState.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import Foundation

enum TodosStatus {
    case initial
    case loading
    case success
    case failure
}

struct TodosState: Equatable {
    let status: TodosStatus
    let todos: [Todo]
    
    init(status: TodosStatus, todos: [Todo] = []) {
        self.status = status
        self.todos = todos
    }
    
    func copyWith(status: TodosStatus? = nil, todos: [Todo]? = nil) -> TodosState {
        return TodosState(status: status ?? self.status, todos: todos ?? self.todos)
    }
    
    static func == (lhs: TodosState, rhs: TodosState) -> Bool {
        return lhs.status == rhs.status && lhs.todos == rhs.todos
    }
}
