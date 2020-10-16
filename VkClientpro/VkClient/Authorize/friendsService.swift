//
//  friendsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 04.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class FriendsService {
    
    var baseUrl = "api.vk.com"
    var token = Session.shared.token
    
    func getFriends (callback: @escaping ([ItemValue]) -> Void) {

        let url = "https://\(baseUrl)/method/friends.get?&access_token=\(token!)&v=5.124"

        let parameters: Parameters = [
            "count": 10,
            "fields": "nickname, photo_200_orig"
        ]

        AF.request(url, method: .get, parameters: parameters) .responseData { (response) in

            let data = response.data!

            let decoder = JSONDecoder()

            let friend = try? decoder.decode(FriendsResponse.self, from: data).response.items
            
            self.saveFriendsData(friend!)
            callback (friend!)
            }
    }
   // сохранение погодных данных в Realm
        func saveFriendsData(_ friends: [ItemValue]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
    // начинаем изменять хранилище
                realm.beginWrite()
    // кладем все объекты класса погоды в хранилище
                realm.add(friends)
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

}

// MARK: - FriendsResponse
class FriendsResponse: Codable {
    let response: Response

    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let items: [ItemValue]

    init(items: [ItemValue]) {
        self.items = items
    }
}

// MARK: - Item
class ItemValue: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var photoOrig: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoOrig = "photo_200_orig"
    }
}
