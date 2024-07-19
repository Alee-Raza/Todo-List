//
//  TodoDataModel+Properties.swift
//  ToDoApp
//
//  Created by Ali Raza on 05/07/2024.
//

import Foundation
import CoreData

@objc(Todo)
class Todo: NSManagedObject {
    @NSManaged var dueDate: Int64
    @NSManaged var todoTitle: String?
    
    convenience init(dueDate: Int64, todoTitle: String, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Todo", in: context)!
        self.init(entity: entity, insertInto: context)
        self.dueDate = dueDate
        self.todoTitle = todoTitle
    }
}
