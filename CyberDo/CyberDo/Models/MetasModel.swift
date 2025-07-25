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
    
    /// função responsavel por fazer o fetch de todas as Metas e salva-los na variavel todos
    func getMeta() {
        metas = CoreDataController.shared.fetchAllMetas()
    }
    
    
    /// Função responsavel por criar uma Meta no coreData
    /// - Parameters:
    ///   - titulo: Titulo da meta
    ///   - maximo: Valor maximo de toDo a serem feitos para concluir a meta
    ///   - categoria: Categoria da meta
    func createMeta(titulo: String, maximo: Double, categoria:String) {
        let result = CoreDataController.shared.creatMeta(xp: 100, titulo: titulo, maximo: maximo, isDone: false, categoria: categoria, atual: 0)
        self.metas.append(result)
    }
    
    /// Deleta uma Meta especifica
    /// - Parameter meta: meta a ser deletado
    func deleteMeta(_ meta: Metas) {
        CoreDataController.shared.deleteMeta(meta)
    }
    
    /// Muda o parametro "isDone" da Meta
    /// - Parameter meta: Meta qual deve ter seu parametro alterado
    func toggleDone(_ meta: Metas) {
        meta.isDone.toggle()
        CoreDataController.shared.saveContext()
        self.objectWillChange.send()
    }
    
    /// Função responsavel por contruir o relacionamento entre as metas e toDos
    /// - Parameters:
    ///   - meta: Meta a qual deve ser vinculada a um toDo
    ///   - toDos: toDo que deve ser vinculado a uma meta
    func addToDoInMeta(meta: Metas, toDos: [ToDo]){
        meta.toDos = NSSet(array: toDos)
        
        CoreDataController.shared.saveContext()
    }
    
    /// Função responsavel por alterar quanto da meta ja foi cumprida
    /// - Parameter meta: meta a ser alterada
    func metaProgress(meta: Metas){
        let todos = meta.toDos.flatMap {
            $0.allObjects as? [ToDo]
        }
        
        let count: Double = Double(todos?.count ?? 0)
        
        if count == 0 {
            print("NO TODOS")
        }
        meta.atual = count
        print("\(meta.atual)")
        CoreDataController.shared.saveContext()
    }
}
