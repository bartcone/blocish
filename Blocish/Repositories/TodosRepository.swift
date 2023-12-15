//
//  TodosRepository.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import Foundation
import Combine

struct TodosRepository {
    let api: TodosApi
    
    func getTodos() -> CurrentValueSubject<[Todo], Never> {
        return api.getTodos()
    }
    
    func saveTodo(title: String, description: String) async {
        let todo = Todo(title: title, description: description)
        await api.saveTodo(todo: todo)
    }
}
