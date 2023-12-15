//
//  InMemoryTodosStore.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import Foundation
import Combine

class InMemoryTodosStore: TodosApi {
    let subject = CurrentValueSubject<[Todo], Never>([
        Todo(title: "Read articles", description: "-"),
        Todo(title: "Buy Groceries", description: "-"),
        Todo(title: "Change light bulbs", description: "-"),
    ])
    
    func saveTodo(todo: Todo) async {
        var todos = subject.value
        todos.append(todo)
        subject.send(todos)
    }
    
    func getTodos() -> CurrentValueSubject<[Todo], Never> {
        return subject
    }
}
