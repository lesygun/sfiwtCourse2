//
//  FriendsTableViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 06.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit
import Alamofire

class FriendsTableViewController: UITableViewController {
    
    //
//    let searchController = UISearchController(searchResultsController: nil)
//    var friends = [Friend]()
//    var currentFriendsArray = [Friend]()
//    var currentFriendTitle = [String]()
//    var currentFriendDictionary = [String: [Friend]]()
    
   // make friends from JSON
    
    var doneFriend = [ItemValue]()
    var testName = String()
    var testId = Int()

//    var friendsDictionary = [String: [String]]
//    var friendSecondNames = [Friend]()
    var friendSectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsTry = FriendsService()
               
               friendsTry.getFriends(callback: { friend in
                self.doneFriend = friend
                   
                self.tableView.reloadData()
                
               })
        
        self.tableView.reloadData()

        // creating titles and dictionary for sections and alphabet order
        //let friendSecondNames = [doneFriend[0].lastName, doneFriend[1].lastName, doneFriend[2].lastName, doneFriend[3].lastName, doneFriend[4].lastName, doneFriend[5].lastName, doneFriend[6].lastName, doneFriend[7].lastName, doneFriend[8].lastName]
        
        //for friendSecondName in friendSecondNames {
            //friendSectionTitles.append(String(friendSecondName.prefix(1)))
        //}
//        for friendSecondName in friendSecondNames {
//            let friendSecondNameKey = String(friendSecondName.prefix(1))
//            if var friendSecondNameValues = friendsDictionary[friendSecondNameKey] {
//                    friendSecondNameValues.append(friendSecondName)// contain massive of [Friend]
//                    friendsDictionary[friendSecondNameKey] = friendSecondNameValues
//                } else {
//                    friendsDictionary[friendSecondNameKey] = [friendSecondName]
//                }
//        }
//        friendSectionTitles = [String](friendsDictionary.keys) // massive of keys in dictionary
       //friendSectionTitles = friendSectionTitles.sorted(by: { $0 < $1 }) // sorted by alphabet order
//        currentFriendTitle = friendSectionTitles
//        currentFriendDictionary = friendsDictionary
//        currentFriendsArray = friendSecondNames

//        searchController.searchResultsUpdater = self
//        definesPresentationContext = true
//        tableView.tableHeaderView = searchController.searchBar
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return friendSectionTitles.count
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let friendKey = friendSectionTitles[section]
//        if let friendSecondNamesValues = friendsDictionary[friendKey] {
//            return friendSecondNamesValues.count
//        }
            
        return doneFriend.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCellKey", for: indexPath) as! FriendTableViewCell
        
       
//        let friendKey = friendSectionTitles [indexPath.section] // из массива стрингов по индексу секции
//        if let friend = friendsDictionary [friendKey]{
////            cell.friendName.text = friend[indexPath.row].friendName
//            cell.avatarCustom.friendAvatar.image = UIImage(named: friend[indexPath.row].friendAvatar)
//        }
        let thisFriend = doneFriend[indexPath.row]
        let url = NSURL(string: thisFriend.photoOrig)
        cell.friendName.text = thisFriend.lastName + " " + thisFriend.firstName
       // cell.avatarCustom.friendAvatar.image = UIImage(named: "mask1")
        
        cell.avatarCustom.friendAvatar.load(url: url! as URL)
        cell.avatarCustom.setup()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photosFriendsController = segue.destination as? PhotosCollectionViewController{
            if let indexPath = tableView.indexPathForSelectedRow{
                let IdKey = doneFriend[indexPath.row].id
                photosFriendsController.friendID = IdKey
            }
        }
    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return friendSectionTitles[section]
//    }
//
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return friendSectionTitles
//    }
//
//    //MARK: Search Bar
//     func updateSearchResults(for searchController: UISearchController) {
//            if searchController.searchBar.text! == "" {
//                currentFriendsArray = friends
//                currentFriendTitle = friendSectionTitles
//                currentFriendDictionary = friendsDictionary
//
//                tableView.reloadData()
//                return
//            }
//
//
//        currentFriendsArray = friends.filter({friend -> Bool in
//            friend.friendName.lowercased().contains(searchController.searchBar.text!.lowercased())
//        })
//        for friendSecondName in currentFriendsArray {
//            let friendSecondNameKey = String(friendSecondName.friendName.prefix(1))
//            if var friendSecondNameValues = currentFriendDictionary[friendSecondNameKey] {
//                    friendSecondNameValues.append(friendSecondName)// contain massive of [Friend]
//                    currentFriendDictionary[friendSecondNameKey] = friendSecondNameValues
//                } else {
//                    currentFriendDictionary[friendSecondNameKey] = [friendSecondName]
//                }
//        }
//        currentFriendTitle = [String](currentFriendDictionary.keys) // massive of keys in dictionary
//        currentFriendTitle = currentFriendTitle.sorted(by: { $0 < $1 })
//
//        tableView.reloadData()
//    }
    
    //MARK: Animations
   
    
}

