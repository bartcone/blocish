//
//  TodosBloc.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import Foundation
import Combine

class TodosBloc: ObservableObject {
    @Published var state: TodosState
    
    let todosRepository: TodosRepository
    var subscription: AnyCancellable?
    
    init(todosRepository: TodosRepository) {
        self.todosRepository = todosRepository
        self.state = TodosState(status: .initial)
    }
    
    func subscribeTodos() {
        state = state.copyWith(status: .loading)
        
        subscription = todosRepository.getTodos()
            .receive(on: DispatchQueue.main)
            .sink { [self] _ in
                state = state.copyWith(status: .failure)
        } receiveValue: { [self] todos in
            state = state.copyWith(status: .success, todos: todos)
        }
    }
    
    func addTodo(title: String, description: String) async {
        await todosRepository.saveTodo(title: title, description: description)
    }
}
