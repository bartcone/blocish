//
//  TodosView.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import SwiftUI

struct TodosView: View {
    @StateObject var bloc = TodosBloc(todosRepository: TodosRepository(api: InMemoryTodosStore()))
    
    var body: some View {
        NavigationStack {
            VStack {
                let state = bloc.state;
                
                switch (state.status) {
                case .initial:
                    ProgressView()
                        .onAppear {
                            bloc.subscribeTodos()
                        }
                case .loading:
                    ProgressView()
                case .success:
                    List(state.todos) { todo in
                        Text(todo.title)
                    }
                case .failure:
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Generate") {
                        Task {
                            await bloc.addTodo(title: "Todo Item", description: "")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TodosView()
}
