//
//  Friends.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 27.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.


import UIKit
import Alamofire

class GetFriends: UIViewController{
    
    @IBOutlet weak var name: UILabel!
    
    let token = Session.shared.token

    override func viewDidLoad(){
        super.viewDidLoad()
        }
    
//    @IBAction func makeFriends(_ sender: Any) {
//       let friend = FriendsService()
//        friend.getFriends(callback: { friend  in
//            self.name.text = String(friend.response)
//    })
//    }
    
    @IBAction func makeGroups(_ sender: Any) {
        
        
       }
    
    @IBAction func makeFotos(_ sender: Any) {
       
    }
}

