//
//  GroupsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 09.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import Alamofire


class GroupsService {
    var baseUrl = "api.vk.com"
    var token = Session.shared.token
    
    func getGroups (callback: @escaping (GroupsResponse) -> Void) {

        let url = "https://\(baseUrl)/method/groups.get?&access_token=\(token!)&v=5.124"

        let parameters: Parameters = [
            "count": 10,
            "filter": "publics",
            "extended": "1"
        ]

        AF.request(url, method: .get, parameters: parameters) .responseData { (response) in

            let data = response.data!

            let decoder = JSONDecoder()
            
            let groupsGalery = try? decoder.decode(GroupsResponse.self, from: data)
            callback(groupsGalery!)
        }
    }
}
// MARK: - Response
struct GroupsResponse: Codable {
    let items: [GroupsItem]
}

// MARK: - Item
struct GroupsItem: Codable {

    let name: String
    let photo200: String

    enum CodingKeys: String, CodingKey {
        case name
        case photo200 = "photo_200"
    }
}
enum TopGroupsCodingKeys: String, CodingKey{
   case response
    case items
}
//MARK: Init of items values
extension GroupsResponse{
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopGroupsCodingKeys.self)

        let meta = try container.nestedContainer(keyedBy: TopGroupsCodingKeys.self, forKey: .response)
        let response = try meta.decode([GroupsItem].self, forKey: .items)
        self.init(items: response)
    }
}

