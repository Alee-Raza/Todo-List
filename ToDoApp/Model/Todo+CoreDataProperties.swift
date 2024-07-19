//
//  Todo+CoreDataProperties.swift
//  ToDoApp
//
//  Created by Ali Raza on 05/07/2024.
//
//

import Foundation
import CoreData

extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var dueDate: Date?
    @NSManaged public var todoTitle: String?

}

extension Todo : Identifiable {

}
