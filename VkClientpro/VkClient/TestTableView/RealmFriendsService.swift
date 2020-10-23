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
    // сохранение погодных данных в Realm
        func saveFriendsData(_ friends: [ItemValue]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
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
    
    func loadFriendsData() {
            do {
                let myFriends = FriendsTableViewController()
            
                let realm = try Realm()
                
                let friends = realm.objects(ItemValue.self)
                
                myFriends.doneFriend = Array(friends)
                
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
        }
    }

}
