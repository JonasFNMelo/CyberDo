//
//  MetasModel.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 22/07/25.
//
//
import Foundation
import CoreData

/// Classe responsavel por controlar os To Do da tela home
class MetasModel: ObservableObject {
    @Published var metas: [Metas] = []
    
    /// função responsavel por fazer o fetch de todos os toDo e salva-los na variavel todos
    func getMeta() {
        metas = CoreDataController.shared.fetchAllMetas()
    }
    
    func createMeta(titulo: String, maximo: Double, categoria:String) {
        let result = CoreDataController.shared.creatMeta(xp: 100, titulo: titulo, maximo: maximo, isDone: false, categoria: categoria, atual: 0)
        
        self.metas.append(result)
    }
    
    /// Deleta um toDo especifico
    /// - Parameter todo: toDo a ser deletado
    func deleteMeta(_ meta: Metas) {
        CoreDataController.shared.deleteMeta(meta)
    }
    
    /// Muda o parametro "isDone" da Meta
    /// - Parameter todo: toDo qual deve ter seu parametro alterado
    func toggleDone(_ meta: Metas) {
        meta.isDone.toggle()
        CoreDataController.shared.saveContext()
        self.objectWillChange.send()
    }
    
    func addToDoInMeta(meta: Metas, toDos: [ToDo]){
        meta.toDos = NSSet(array: toDos)
        

        CoreDataController.shared.saveContext()
    }

    
    func metaProgress(meta: Metas){
        let todos = meta.toDos.flatMap {
            $0.allObjects as? [ToDo]
        }
        
        var count: Double = 0
        if let todos = todos {
            for todo in todos {
                if todo.isDone == true{
                    count += 1
                }
            }
        }
        else {
            print("NO TODOS")
        }
        meta.atual = count
        CoreDataController.shared.saveContext()
    }
    
}
