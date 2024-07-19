//
//  CoreDataManager.swift
//  ToDoApp
//
//  Created by Ali Raza on 05/07/2024.
//

import Foundation
import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
   private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoDataModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchTodos() -> [Todo] {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        do {
            let todos = try context.fetch(fetchRequest)
            return todos
        } catch {
            print("Fetch failed: \(error)")
            return []
        }
    }
    
    func deleteTodo(todo: Todo) {
        context.delete(todo)
        saveContext()
    }
    
    func updateTodo(todo: Todo, newTitle: String, newDueDate: Date?) {
        todo.todoTitle = newTitle
        todo.dueDate = newDueDate
        saveContext()
    }
}
