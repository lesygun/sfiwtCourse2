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
           
            callback(photoGalery!)
            debugPrint("Hi")
        }
    }
}

//// MARK: - PhotoGalery
//struct PhotoGalery: Codable {
//    let response: PhotoResponse
//}
//
//// MARK: - Response
//struct PhotoResponse: Codable {
//    let count: Int
//    let items: [Item]
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let albumID: Int
//    let id: Int
//    let sizes: [Size]
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case id
//        case sizes
//    }
//}
//
//// MARK: - Size
//struct Size: Codable {
//    let url: String
//    let type: String
//}
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
class PhotoItem: Codable {
    let albumID: Int
    let id: Int
    let sizes: [Size]

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id
        case sizes
    }

    init(albumID: Int, id: Int, sizes: [Size]) {
        self.albumID = albumID
        self.id = id
        self.sizes = sizes
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
