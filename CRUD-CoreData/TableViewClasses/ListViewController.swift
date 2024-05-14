//
//  ListViewController.swift
//  CRUD-CoreData
//
//  Created by Macbook on 14/05/2024.
//

import UIKit
protocol DataPass{
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var student = [Student]()
    var delegate:DataPass!
    
    @IBOutlet weak var tblVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = ClassHelper.shareInstance.getStudentData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.student = student[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = ClassHelper.shareInstance.deleteData(index: indexPath.row)
            self.tblVIew.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        delegate.data(object: dict as![String:String], index: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }

}
