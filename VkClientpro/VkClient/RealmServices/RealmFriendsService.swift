//
//  RealmFriendsService.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 18.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import Foundation
import RealmSwift

class RealmFriendsService{
    
    var doneFriend = [ItemValue]()
    // сохранение погодных данных в Realm
        func saveFriendsData(_ friends: [ItemValue]) {
//    Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            do {
                let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    // получаем доступ к хранилищу
                let realm = try Realm(configuration: config)
    // все старые погодные данные для текущего города
                let oldFriends = realm.objects(ItemValue.self)
    // начинаем изменять хранилище
                realm.beginWrite()
    // удаляем старые данные
                realm.delete(oldFriends)
    // кладем все объекты класса погоды в хранилище
                realm.add(friends)
    // завершаем изменения хранилища
                try realm.commitWrite()
                print(realm.configuration.fileURL!)
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }
    
    func loadFriendsData()-> [ItemValue] {
            do {
                let realm = try Realm()
                
                let friends = realm.objects(ItemValue.self)
                
                doneFriend = Array(friends)
                
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
        }
        return doneFriend
    }

}
