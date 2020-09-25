//
//  Session.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 25.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    var token: String?
    var userId: Int?
    
    private init(){
        
    }
}
