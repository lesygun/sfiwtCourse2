//
//  friendsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 04.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import Alamofire

class FriendsService {
    
    var baseUrl = "api.vk.com"
    var token = Session.shared.token
    
    func getFriends (callback: @escaping (FriendsModel) -> Void) {
        
        let url = "http://\(baseUrl)/method/friends.get?&access_token=\(token!)&v=5.124"
        
        let parameters: Parameters = [
            "count": 10,
            "fields": "nickname, photo_200_orig"
        ]
        
        AF.request(url, method: .get, parameters: parameters) .responseData { (response) in
            
            let data = response.data!
            
            let decoder = JSONDecoder()
            
            let friend = try? decoder.decode(FriendsModel.self, from: data)
            debugPrint(friend)
            }
    }
    
}


struct FriendsModel: Decodable{
    
    let id: Int
    let first_name: String
    let last_name: String
    let photo_200_orig: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let responseValues = try values.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        let itemsValues = try responseValues.nestedContainer(keyedBy: ItemsKeys.self, forKey: .items)
        
        
        self.id = try itemsValues.decode(Int.self, forKey: .id)
        self.first_name = try itemsValues.decode(String.self, forKey: .first_name)
        self.last_name = try itemsValues.decode(String.self, forKey: .last_name)
        self.photo_200_orig = try itemsValues.decode(String.self, forKey: .photo_200_orig)
    }
    
    enum CodingKeys: String, CodingKey{
        case response
    }
    
    enum ResponseKeys: String, CodingKey {
        case items
    }
    
    enum ItemsKeys: String, CodingKey{
        case id, first_name, last_name, photo_200_orig
    }
    
}
