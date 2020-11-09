//
//  NewsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 09.11.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class NewsService {
    var baseUrl = "api.vk.com"
        var token = Session.shared.token
        let realmService = RealmNewsService()
        
        func getGroups (callback: @escaping () -> Void) {

            let url = "https://\(baseUrl)/method/newsfeed.get?&access_token=\(token!)&v=5.124"

            let parameters: Parameters = [
                "count": 10,
                "filter": "post",
                "return_banned": "0",
            ]

            AF.request(url, method: .get, parameters: parameters) .responseData { (response) in

                let data = response.data!

                let decoder = JSONDecoder()
                
                let phtotGalery = try? decoder.decode(GroupResponse.self, from: data).response.items
                
                self.realmService.saveNewsData(phtotGalery!)
                callback()
            }
        }
}
