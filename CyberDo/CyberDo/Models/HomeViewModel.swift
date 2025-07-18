//
//  ProfeileViewModel.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//

import Foundation
import CoreData

/// Classe responsavel por controlar os To Do da tela home
class HomeViewModel: ObservableObject {
    @Published var todos: [ToDo] = []
    
    /// função responsavel por fazer o fetch de todos os toDo e salva-los na variavel todos
    func getToDo() {
        todos = CoreDataController.shared.fetchAllToDos()
    }
    
    /// Cria um novo toDo no coreData
    /// - Parameters:
    ///   - nome: Nome desse ToDo
    ///   - descricao: Descrição do ToDo
    ///   - categoria: Categoria do ToDo
    ///   - frequencia: Frequencia na qual esse ToDo deve ser feito
    func createToDo(nome: String, descricao: String, categoria: String, frequencia: String) {
        let result = CoreDataController.shared.createToDo(nome: nome, descricao: descricao, isDone: false, categoria: categoria, frequencia: frequencia)
        self.todos.append(result)
    }
    
    /// Deleta um toDo especifico
    /// - Parameter todo: toDo a ser deletado
    func deleteToDo(_ todo: ToDo) {
        CoreDataController.shared.deleteToDo(todo)
    }
    
    /// Muda o parametro "isDone" do toDo
    /// - Parameter todo: toDo qual deve ter seu parametro alterado
    func toggleDone(_ todo: ToDo) {
        todo.isDone.toggle()
        CoreDataController.shared.saveContext()
        self.objectWillChange.send()
    }
    
}


