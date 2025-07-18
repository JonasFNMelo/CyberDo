//
//  ProfeileViewModel.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import Foundation
import CoreData

class ContentViewModel: ObservableObject {
    @Published var todos: [ToDo] = []
    
    func getToDo() {
        todos = CoreDataController.shared.fetchAllToDos()
    }
    
    func createToDo(nome: String, descricao: String, categoria: String, frequencia: String) {
        let result = CoreDataController.shared.createToDo(nome: nome, descricao: descricao, isDone: false, categoria: categoria, frequencia: frequencia)
        self.todos.append(result)
    }
    
    func deleteToDo(_ todo: ToDo) {
        CoreDataController.shared.deleteToDo(todo)
    }
    
    func toggleDone(_ todo: ToDo) {
        todo.isDone.toggle()
        CoreDataController.shared.saveContext()
        self.objectWillChange.send()
    }
    
}


