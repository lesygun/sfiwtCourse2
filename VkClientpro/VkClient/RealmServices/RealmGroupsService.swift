//
//  RealmGroupsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 23.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import RealmSwift

class RealmGroupsService{
    
    var doneGroups = [GroupItem]()
    
    func  saveGroupsData(_ groups: [GroupItem]) {
        
//        Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        do {
            
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            let oldGroups = realm.objects(GroupItem.self)

            realm.beginWrite()
            realm.delete(oldGroups)
            realm.add(groups)
            try realm.commitWrite()
            
            print(realm.configuration.fileURL!)
            
        } catch {
            print(error)
        }
    }
    
    func loadGroupsData()-> [GroupItem] {
            do {
                let realm = try Realm()
                
                let groups = realm.objects(GroupItem.self)
                
                doneGroups = Array(groups)
                
            } catch {
                print(error)
        }
        return doneGroups
    }
}
