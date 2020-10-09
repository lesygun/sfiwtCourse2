//
//  PhotoService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 08.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import Alamofire

class PhotoService {
    
    var baseUrl = "api.vk.com"
    var token = Session.shared.token
    
    func getFriends (callback: @escaping (Response) -> Void) {

        let url = "https://\(baseUrl)/method/friends.get?&access_token=\(token!)&v=5.124"

        let parameters: Parameters = [
            "count": 10,
            "fields": "nickname, photo_200_orig"
        ]

        AF.request(url, method: .get, parameters: parameters) .responseData { (response) in

            let data = response.data!

            let decoder = JSONDecoder()

            let friend = try? decoder.decode(Response.self, from: data)
            callback (friend!)
            }
    }
}

