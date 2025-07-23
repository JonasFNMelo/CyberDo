//
//  CoreDataController.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//


import CoreData
import Foundation

/// Classe que controla o coreData
class CoreDataController {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    /// Iniciador privado da classe, serve para acessar metodos sem instancia
    private init() {
        persistentContainer = NSPersistentContainer(name: "CyberDoModel")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
            
        }
    }
    
    /// Salva alterações no coreData
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    /// Cria um novo toDo no coreData
    /// - Parameters:
    ///   - nome: nome desse toDo
    ///   - descricao: descrição desse toDo
    ///   - isDone: estado do toDo (feito ou não)
    ///   - categoria: Categoria do toDo
    ///   - frequencia: Frequencia na qual esse toDo deve ser realizada
    /// - Returns: Retorna esse mesmo toDo criado
    func createToDo(nome: String, descricao: String, isDone: Bool, categoria: String, frequencia: String, prioridade: String) -> ToDo {
        let toDo = ToDo(context: viewContext)
        
        toDo.nome = nome
        toDo.descricao = descricao
        toDo.isDone = isDone
        toDo.categoria = categoria
        toDo.frequencia = frequencia
        toDo.prioridade = prioridade
                
        saveContext()
        return toDo
    }
    
    
    /// Função responsavel por pegar todos os toDo guardados em memoria
    /// - Returns: Retorna lista de toDos
    func fetchAllToDos() -> [ToDo] {
        let fetchRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching ToDos: \(error.localizedDescription)")
            return []
        }
    }
    
    /// Função responsavel por remover um toDo expecifico
    /// - Parameter todo: toDo a ser removido
    func deleteToDo(_ todo: ToDo) {
        viewContext.delete(todo)
        
        saveContext()
    }
    
    
    
    func creatMeta(xp: Double, titulo: String, maximo: Double, isDone: Bool, categoria:String, atual: Double) -> Metas {
        let meta = Metas(context: viewContext)
        
        meta.xp = xp
        meta.titulo = titulo
        meta.maximo = maximo
        meta.isDone = isDone
        meta.categoria = categoria
        meta.atual = atual
        
        saveContext()
        return meta
    }
    
    func fetchAllMetas() -> [Metas] {
        let fetchRequest: NSFetchRequest<Metas> = Metas.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching ToDos: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteMeta(_ meta: Metas) {
        viewContext.delete(meta)
        
        saveContext()
    }
}
