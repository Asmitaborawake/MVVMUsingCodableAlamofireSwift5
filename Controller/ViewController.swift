//
//  ViewController.swift
//  MVVMUsingCodableAlamofireDemo
//
//  Created by Asmita Borawake on 17/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var userViewModel =  UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        userViewModel.vc = self
        userViewModel.getUserDataUsingAlamofire()
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "usercell")
    }
    
    
    
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userViewModel.arrUsers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as? UserTableViewCell
        
        let modeluser = userViewModel.arrUsers[indexPath.row]
        
        cell?.modelUser = modeluser
       // cell?.cellConfiguration() configure cell in tablviewcell
        
        return cell!
        
    }
}
