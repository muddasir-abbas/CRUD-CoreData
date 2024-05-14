//
//  Student+CoreDataProperties.swift
//  CRUD-CoreData
//
//  Created by Macbook on 14/05/2024.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var mobile: String?
    @NSManaged public var city: String?

}

extension Student : Identifiable {

}
