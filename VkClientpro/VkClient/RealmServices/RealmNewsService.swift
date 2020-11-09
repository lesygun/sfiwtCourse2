//
//  RealmNewsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 09.11.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import RealmSwift

class RealmNewsService{
    var friendPhotos = [PhotoItem]()
    
    func  saveNewsData(_ photos: [PhotoItem]) {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        do {
            
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            let oldPhotos = realm.objects(PhotoItem.self)

            realm.beginWrite()
            realm.delete(oldPhotos)
            realm.add(photos)
            try realm.commitWrite()
            
            print(realm.configuration.fileURL!)
            
        } catch {
            print(error)
        }
    }
    
    func loadNewsData()-> [PhotoItem] {
            do {
                let realm = try Realm()
                
                let photos = realm.objects(PhotoItem.self)
                
                friendPhotos = Array(photos)
                
            } catch {
                print(error)
        }
        return friendPhotos
    }
}
