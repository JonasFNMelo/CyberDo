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
    func createToDo(nome: String, descricao: String, isDone: Bool, categoria: String, prioridade: String, data: Date, isCounted: Bool) -> ToDo {
        let toDo = ToDo(context: viewContext)
        
        toDo.nome = nome
        toDo.descricao = descricao
        toDo.isDone = isDone
        toDo.categoria = categoria
        toDo.prioridade = prioridade
        toDo.date = data
        toDo.isCounted = isCounted
        
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
    
    
    
    /// Função para criar uma nova meta no coraData
    /// - Parameters:
    ///   - xp: xp que a meta vai dar ao ser concluida
    ///   - titulo: titulo da meta
    ///   - maximo: valor maximo de toDos a serem feitos para conslusao da meta
    ///   - isDone: variavel que verifica quando a meta fica pronta
    ///   - categoria: categoria da meta
    ///   - atual: quantos toDos ja foram feitos
    /// - Returns: retorna a propria meta criada
    func creatMeta(xp: Double, titulo: String, maximo: Double, isDone: Bool, categoria:String, atual: Double, isCounted: Bool) -> Metas {
        let meta = Metas(context: viewContext)
        
        meta.xp = xp
        meta.titulo = titulo
        meta.maximo = maximo
        meta.isDone = isDone
        meta.categoria = categoria
        meta.atual = atual
        meta.isCounted = isCounted
        
        saveContext()
        return meta
    }
    
    /// Função que puxa todas as metas salvas
    /// - Returns: Retorna todas as metas salvas
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
    
    /// Deleta uma meta
    /// - Parameter meta: meta a ser deletada
    func deleteMeta(_ meta: Metas) {
        viewContext.delete(meta)
        
        saveContext()
    }
    
    /// Função que cria um User no coreData
    /// - Parameters:
    ///   - destreza: valor inicial de destreza
    ///   - fe: valor inicial de fe
    ///   - forca: valor inicial de forca
    ///   - inteligencia: valor inicial de inteligencia
    ///   - nivel: valor inicial de nivel
    ///   - ofensiva: valor inicial de ofensiva
    ///   - resistencia: valor inicial de resistencia
    ///   - sintonia: valor inicial de sintonia
    ///   - vigor: valor inicial de vigor
    ///   - vitalidade: valor inicial de vitalidade
    ///   - xp: valor inicial de xp
    /// - Returns: o proprio User criado
    func createUser(destreza: Double, fe: Double, forca: Double, inteligencia: Double, nivel: Double, ofensiva: Double, resistencia: Double, sintonia: Double, vigor: Double, vitalidade: Double, xp: Double, maxXp: Double, ofensivaDays: Double, date: Date) -> User {
        let user = User(context: viewContext)
        
        user.destreza = destreza
        user.fe = fe
        user.forca = forca
        user.inteligencia = inteligencia
        user.nivel = nivel
        user.ofensiva = ofensiva
        user.resistencia = resistencia
        user.sintonia = sintonia
        user.vigor = vigor
        user.vitalidade = vitalidade
        user.xp = xp
        user.maxXp = maxXp
        user.ofensivaDays = ofensivaDays
        user.date = date
        
        saveContext()
        return user
    }
    
    
    /// Função responsavel por pegar todos os User guardados em memoria
    /// - Returns: Retorna lista de User
    func fetchUser() -> [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching ToDos: \(error.localizedDescription)")
            return []
        }
    }
    
    /// Função responsavel por remover um User expecifico
    /// - Parameter todo: User a ser removido
    func deleteUser(_ user: User) {
        viewContext.delete(user)
        
        saveContext()
    }
}
