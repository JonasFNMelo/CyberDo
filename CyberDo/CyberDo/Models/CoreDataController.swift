//
//  CoreDataController.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//


//import CoreData
//import Foundation
//
//class CoreDataController {
//    static let shared = CoreDataController()
//    
//    let persistentContainer: NSPersistentContainer
//    var viewContext: NSManagedObjectContext {
//        persistentContainer.viewContext
//    }
//    
//    private init() {
//        persistentContainer = NSPersistentContainer(name: "Model")
//        
//        persistentContainer.loadPersistentStores { _, error in
//            if let error = error {
//                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
//            }
//            
//        }
//    }
//    
//    func saveContext() {
//        if viewContext.hasChanges {
//            do {
//                try viewContext.save()
//            } catch {
//                print("Error saving context: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func createToDo(title: String, desc: String, isDone: Bool) -> ToDo {
//        let toDo = ToDo(context: viewContext)
//        
//        toDo.title = title
//        toDo.desc = desc
//        toDo.isDone = isDone
//        
//        saveContext()
//        return toDo
//    }
//    
//    func fetchAllToDos() -> [ToDo] {
//        let fetchRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
//        
//        do {
//            let result = try viewContext.fetch(fetchRequest)
//            return result
//        } catch {
//            print("Error fetching ToDos: \(error.localizedDescription)")
//            return []
//        }
//    }
//    
//    func deleteToDo(_ todo: ToDo) {
//        viewContext.delete(todo)
//        
//        saveContext()
//    }
//}
