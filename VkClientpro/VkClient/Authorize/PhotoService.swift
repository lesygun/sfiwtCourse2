//
//  PhotoService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 08.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class PhotoService {
    
    var baseUrl = "api.vk.com"
    var token = Session.shared.token
    
    func getPhotos (id: Int, callback: @escaping ([PhotoItem]) -> Void) {

        let url = "https://\(baseUrl)/method/photos.get?&access_token=\(token!)&v=5.124"

        let parameters: Parameters = [
            "count": 8,
            "owner_id": id,
            "album_id": "profile"
        ]

        AF.request(url, method: .get, parameters: parameters) .responseData { (response) in

            let data = response.data!

            let decoder = JSONDecoder()
            
            let photoGalery = try? decoder.decode(PhotoResponse.self, from: data).response.items
           
            self.savePhotosData(photoGalery!)
            callback(photoGalery!)
        }
    }
    
    func  savePhotosData(_ photos: [PhotoItem]) {

            do {

                let realm = try Realm()

                realm.beginWrite()
                realm.add(photos)

                try realm.commitWrite()
                
            } catch {
                print(error)
            }
        }
}
// MARK: - PhotoResponse
class PhotoResponse: Codable {
    let response: MyResponse

    init(response: MyResponse) {
        self.response = response
    }
}
// MARK: - Response
class MyResponse: Codable {
    let items: [PhotoItem]

    init(count: Int, items: [PhotoItem]) {
        self.items = items
    }
}
// MARK: - Item
class PhotoItem: Object, Codable {
    let albumID: Int
    let id: Int
    let sizes: [Size]

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id
        case sizes
    }
}
// MARK: - Size
class Size: Codable {

    let url: String
    let type: String

    init(url: String, type: String) {
        self.url = url
        self.type = type
    }
}
