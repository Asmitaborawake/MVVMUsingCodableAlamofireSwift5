//
//  UserTableViewCell.swift
//  MVVMUsingCodableAlamofireDemo
//
//  Created by Asmita Borawake on 17/12/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status: UILabel!
    //set the value to cell once it come 
    var modelUser : UserModel?{
        didSet{
            cellConfiguration()
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
    
    func cellConfiguration(){
        let statusData = modelUser?.getStatusColor()
        
        status.text = statusData?.0
        backgroundColor = statusData?.1
        
        
        if let userid = modelUser?.userId{
            userId.text = "\(userid)"
        }else{
            userId.text = "No Data"
        }
        
        title.text = modelUser?.title
    }
}
