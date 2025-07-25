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
class UserModel: ObservableObject {
    @Published var users: [User] = []
    /// função responsavel por fazer o fetch de todos os toDo e salva-los na variavel todos
    func getUser() {
        users = CoreDataController.shared.fetchUser()
    }
    
    
    /// Função para criar um novo User (o User só pode ser criado uma vez)
    func createUser() {
        
        getUser()
        if users.isEmpty{
            let result = CoreDataController.shared.createUser(destreza: 0, fe: 0, forca: 0, inteligencia: 0, nivel: 1, ofensiva: 0, resistencia: 0, sintonia: 0, vigor: 0, vitalidade: 0, xp: 0)
            self.users.append(result)
            print("user criado")

        }
        print("user ja existe")
    }
   
    
    /// Função responsavel por vincular os ToDo ao user
    /// - Parameters:
    ///   - user: User
    ///   - toDos: ToDo a ser vinculado
    func addToDoInUser(user: User, toDos: [ToDo]){
        user.toDos = NSSet(array: toDos)
        
        CoreDataController.shared.saveContext()
    }
    
    /// Função responsavel por vincular os Metas ao user
    /// - Parameters:
    ///   - user: User
    ///   - metas: Meta a ser vinculada
    func addMetaInUser(user: User, metas: [Metas]){
        user.metas = NSSet(array: metas)
        
        CoreDataController.shared.saveContext()
    }
   
    
    /// Função que muda o valor da ofensiva do user
    /// - Parameter user: User
    func ofensivaProgress(user: User){
        
        let todos = user.toDos.flatMap {
            $0.allObjects as? [ToDo]
        }
        var count: Int = 0
        
        for todo in todos ?? []{
            if todo.isDone == true{
                count += 1
            }
        }
        if count == todos?.count && user.ofensiva < 30{
            user.ofensiva += 1
        }

        CoreDataController.shared.saveContext()
    }
    
    
    /// Função que deleta o user
    /// - Parameter user: User
    func deleteUser(_ user: User) {
        CoreDataController.shared.deleteUser(user)
    }
}
