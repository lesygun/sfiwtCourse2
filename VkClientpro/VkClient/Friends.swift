//
//  Friends.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 27.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit
import Alamofire

class GetFriends: UIViewController{
    //параметры друзей
    let parameters: Parameters = [
    "order":"random",
    "count": "300"
    ]
    //параметры фотографий
    let parametersPhotos: Parameters = [
    "album_id":"profile",
    "rev": "0"
    ]
    //параметры групп
    let parametersGroups: Parameters = [
    "count":"10",
    "filter": "groups"
    ]
    // параметры на группы по поисковому запросу
    let parametersGroupsSearch: Parameters = [
    "q":"Music"
    ]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //ссылка на запрос друзей
        let url = "https://api.vk.com/method/friends.get?&access_token=\(String(describing: Session.shared.token))&v=5.124"
        //ссылка на запрос фотографий
        let urlPhotos = "https://api.vk.com/method/photos.get?&access_token=\(String(describing: Session.shared.token))&v=5.124"
        //ссылка на запрос групп
        let urlGroups = "https://api.vk.com/method/groups.get?&access_token=\(String(describing: Session.shared.token))&v=5.124"
        // ссылка на группы по поисковому запросу
        let urlGroupsSearch = "https://api.vk.com/method/groups.search?&access_token=\(String(describing: Session.shared.token))&v=5.124"
        
        //запрос друзей
        AF.request(url, method: .get, parameters: parameters) .responseJSON {(response) in
            
            debugPrint(response)
        }
        //запрос фотографий
        AF.request(urlPhotos, method: .get, parameters: parametersPhotos) .responseJSON {(response) in
            
            debugPrint(response)
        }
        //запрос групп
        AF.request(urlGroups, method: .get, parameters: parametersGroups) .responseJSON {(response) in
            
            debugPrint(response)
        }
        //запрос групп по поисковому запросу
        AF.request(urlGroupsSearch, method: .get, parameters: parametersGroupsSearch) .responseJSON {(response) in
            
            debugPrint(response)
        }
    }
    
}
