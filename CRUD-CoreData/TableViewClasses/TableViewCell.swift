//
//  TableViewCell.swift
//  CRUD-CoreData
//
//  Created by Macbook on 14/05/2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblMobile: UILabel!
    var student:Student! {
        didSet{
            lblName.text = student.name
            lblAddress.text = student.address
            lblCity.text = student.city
            lblMobile.text = student.mobile
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
