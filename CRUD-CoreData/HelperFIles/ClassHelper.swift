//
//  ClassHelper.swift
//  CRUD-CoreData
//
//  Created by Macbook on 14/05/2024.
//

import Foundation
import CoreData
import UIKit

class ClassHelper {
    
    static var shareInstance = ClassHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        let student =
        NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do{
            try context?.save()
            
        } catch{
            print("Data is not Saved")
        }
    }
    func getStudentData() -> [Student] {
        var student = [Student] ()
        let fetchRequest = NSFetchRequest<NSManagedObject> (entityName: "Student")
        do{
            student = try context?.fetch(fetchRequest) as! [Student]
            
        }catch{
            print("Can Not Get Data")
            
        }
        return student
    }
     func deleteData(index:Int) -> [Student] {
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Can't Delete Student Data")
        }
        return student
    }
    func editData(object:[String:String], i:Int){
        var student = getStudentData()
        student[i].name = object["name"]
        student[i].address = object["address"]
        student[i].city = object["city"]
        student[i].mobile = object["mobile"]
        do{
            try context?.save()
        }catch{
            print("Data is Not Edit")
        }
    }
}
