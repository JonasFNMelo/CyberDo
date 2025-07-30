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
    @Published var metaModel = MetasModel()
    /// função responsavel por fazer o fetch de todos os toDo e salva-los na variavel todos
    func getUser() {
        users = CoreDataController.shared.fetchUser()
    }
    
    func x() -> Bool { return Bool.random() }
    
    /// Função para criar um novo User (o User só pode ser criado uma vez)
    func createUser() {
        
        getUser()
        if users.isEmpty{
            let result = CoreDataController.shared.createUser(destreza: 0, fe: 0, forca: 0, inteligencia: 0, nivel: 1, ofensiva: 1, resistencia: 0, sintonia: 0, vigor: 0, vitalidade: 0, xp: 0, maxXp: 200, ofensivaDays: 0, date: Date.now)
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
        if (user.date?.dayInt ?? 0) + 1 == Date.now.dayInt{
//        if (user.date?.distance(to: Date.now) ?? 0) >= TimeInterval(10) {

            user.date = Date.now
            if count == todos?.count && user.ofensiva < 30 && count != 0{
                user.ofensivaDays += 1
                user.ofensiva = user.ofensivaDays/30 * 1.5 + 1
            }
            
        }
        CoreDataController.shared.saveContext()
    }
    
    private func uparAtributos(toDo: ToDo, user: User){
        if toDo.isDone == true {
            
            switch toDo.categoria {
            case "Destreza":
                user.destreza += 1
            case "Inteligência":
                user.inteligencia += 1
            case "Resistencia":
                user.resistencia += 1
            case "Vitalidade":
                user.vitalidade += 1
            case "Sintonia":
                user.sintonia += 1
            case "Vigor":
                user.vigor += 1
            case "Fé":
                user.fe += 1
            case "Força":
                user.forca += 1
            default:
                print("nao upei")
            }
            
            CoreDataController.shared.saveContext()
            
        }
    }
    
    func uparNivel(user: User, toDos: [ToDo]){
        if user.xp >= user.maxXp {
            user.nivel += 1
            user.xp = user.xp - user.maxXp
            user.maxXp = user.maxXp * user.nivel
            
            for todo in toDos {
                uparAtributos(toDo: todo, user: user)
            }
        }
    }
    
    func xpProgress(user: User){
        metaModel.getMeta()
        let todos = user.toDos.flatMap {
            $0.allObjects as? [ToDo]
        }
        let metas = user.metas.flatMap {
            $0.allObjects as? [Metas]
        }
        
        user.xp += (Double(50*(todos?.count ?? 0)) + Double(100*(metas?.count ?? 0))) * user.ofensiva
        
        metas?.forEach { meta in
            meta.isCounted = true
        }
        CoreDataController.shared.saveContext()
        
        for meta in metaModel.metas{
            metaModel.deleteMeta(meta)
        }
        
        CoreDataController.shared.saveContext()
    }
    
    func adcionarToDos(user: User, toDos: [ToDo]){
        var toDosCorretos: [ToDo] = []
        for toDo in toDos{
            if toDo.isDone == true && toDo.isCounted == false{
                toDo.isCounted = true
                toDosCorretos.append(toDo)
            }
        }
        user.toDos = NSSet(array: toDosCorretos)
        
        CoreDataController.shared.saveContext()
    }
    
    func adcionarMetas(user: User, metas: [Metas]){
        var metasCorretas: [Metas] = []
        for meta in metas{
            if meta.isDone == true && meta.isCounted == false{
                metasCorretas.append(meta)
            }
        }
        user.metas = NSSet(array: metasCorretas)
        
        CoreDataController.shared.saveContext()
    }
    
    /// Função que deleta o user
    /// - Parameter user: User
    func deleteUser(_ user: User) {
        CoreDataController.shared.deleteUser(user)
    }
    
}
