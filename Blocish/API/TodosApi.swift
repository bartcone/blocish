//
//  TodosApi.swift
//  Blocish
//
//  Created by Bart Cone on 12/14/23.
//

import Foundation
import Combine

protocol TodosApi {
    func getTodos() -> CurrentValueSubject<[Todo], Never>
    func saveTodo(todo: Todo) async
}



