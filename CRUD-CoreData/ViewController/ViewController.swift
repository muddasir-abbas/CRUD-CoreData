//
//  ViewController.swift
//  CRUD-CoreData
//
//  Created by Macbook on 14/05/2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, DataPass {
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtPhnNumber: UITextField!
    @IBOutlet weak var save: UIButton!

    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSave(_ sender: Any) {
        let dict =
        ["name": txtName.text, "address":txtAddress.text, "city": txtCity.text, "mobile": txtPhnNumber.text]
        if isUpdate{
            ClassHelper.shareInstance.editData(object: dict as! [String:String], i: i)
        }else{
            ClassHelper.shareInstance.save(object: dict as! [String: String])
        }
        
    }
    @IBAction func btnShow(_ sender: Any) {
        guard let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtPhnNumber.text = object["mobile"]
        i = index
        isUpdate = isEdit
    }
}
