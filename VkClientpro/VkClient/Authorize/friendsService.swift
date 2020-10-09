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

// MARK: - Responses
struct Response: Codable {
    let items: [Items]
}

// MARK: - Item
struct Items: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let photoOrig: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoOrig = "photo_200_orig"
    }
}
enum TopCodingKeys: String, CodingKey {
    case response
    case items
}
//MARK: Init of items values
extension Response{
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopCodingKeys.self)

        let meta = try container.nestedContainer(keyedBy: TopCodingKeys.self, forKey: .response)
        let response = try meta.decode([Items].self, forKey: .items)
        self.init(items: response)
    }
}
