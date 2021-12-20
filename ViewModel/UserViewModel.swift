//
//  UserViewModel.swift
//  MVVMUsingCodableAlamofireDemo
//
//  Created by Asmita Borawake on 17/12/21.
//

import Foundation
import UIKit
import Alamofire
class UserViewModel{
    
    weak var vc: ViewController?
    var arrUsers = [UserModel]()
    
    //get data uisng almofire
    func getUserDataUsingAlamofire(){
        
        AF.request("https://jsonplaceholder.typicode.com/todos/").response{
            response in
            
            if let data = response.data{
                do{
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    
                    print(userResponse)
                    
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tableView.reloadData()
                    }
                    
                }catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    //get data using codable
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error )in
            if error == nil {
                if let data = data{
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        
                        print(userResponse)
                        
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                        
                    }catch let error{
                        print(error.localizedDescription)
                    }
                }
            }else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
