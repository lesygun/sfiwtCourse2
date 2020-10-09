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
    
    var doneFriend = [Items]()
    var testName = String()
    var testId = Int()
    

    //MARK: Generate friends
//    let cruzPhotos: [String?] = ["cruz1", "cruz2", "cruz3", "cruz4"]
//    let stalonePhotos: [String?] = ["stal1", "stal2", "stal3", "stal4", "stal5"]
//    let maskPhotos: [String?] = ["mask1", "mask2", "mask3", "mask4", "mask5", "mask6"]
//    let buninPhotos: [String?] = ["bunin1", "bunin2", "bunin3", "bunin4", "bunin5"]
//    let westPhotos: [String?] = ["west1", "west2", "west3", "west4", "west5", "west6", "west7"]
//    let enistonPhotos: [String?] = ["anis1", "anis2", "anis3", "anis4"]
//    let cvetaevaPhotos: [String?] = ["cvet1","cvet2","cvet3"]
//    let trumpPhotos: [String?] = ["trump1", "trump2", "trump3", "trump4"]
//    let ahmatovaPhotos: [String?] = ["ahmat1", "ahmat2", "ahmat3", "ahmat4"]
//
//    private func generateFriends () {
//        let friend1 = Friend(friendName: "Круз Том", friendAvatar: "cruz1", friendPhotos: cruzPhotos)
//        let friend2 = Friend(friendName: "Сталлоне Сильвестер", friendAvatar: "stal1", friendPhotos: stalonePhotos)
//        let friend3 = Friend(friendName: "Маск Илон", friendAvatar: "mask1", friendPhotos: maskPhotos)
//        let friend4 = Friend(friendName: "Бунин Иван", friendAvatar: "bunin1", friendPhotos: buninPhotos)
//        let friend5 = Friend(friendName: "Вест Канье", friendAvatar: "west1", friendPhotos: westPhotos)
//        let friend6 = Friend(friendName: "Энистон Джэнифер", friendAvatar: "anis1", friendPhotos: enistonPhotos)
//        let friend7 = Friend(friendName: "Цветаева Марина", friendAvatar: "cvet1", friendPhotos: cvetaevaPhotos)
//        let friend8 = Friend(friendName: "Трамп Дональд", friendAvatar: "trump1", friendPhotos: trumpPhotos)
//        let friend9 = Friend(friendName: "Ахматова Анна", friendAvatar: "ahmat1", friendPhotos: ahmatovaPhotos)
//
//        friends.append(friend1); friends.append(friend2); friends.append(friend3); friends.append(friend4); friends.append(friend5); friends.append(friend6); friends.append(friend7); friends.append(friend8); friends.append(friend9)
//        currentFriendsArray = friends
//        tableView.reloadData()
//
//    }

//    var friendsDictionary = [String: [Friend]]()
//    var friendSecondNames = [Friend]()
//    var friendSectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsTry = FriendsService()
               
               friendsTry.getFriends(callback: { friend in
                   self.doneFriend = friend.items
                   self.testName = friend.items[0].firstName
                   self.testId = friend.items[0].id
                self.tableView.reloadData()
                
               })
        
        self.tableView.reloadData()

//        generateFriends()
//        // creating titles and dictionary for sections and alphabet order
//        friendSecondNames = [friends[0], friends[1], friends[2], friends[3], friends[4], friends[5], friends[6], friends[7], friends[8]]
//
//        for friendSecondName in friendSecondNames {
//            let friendSecondNameKey = String(friendSecondName.friendName.prefix(1))
//            if var friendSecondNameValues = friendsDictionary[friendSecondNameKey] {
//                    friendSecondNameValues.append(friendSecondName)// contain massive of [Friend]
//                    friendsDictionary[friendSecondNameKey] = friendSecondNameValues
//                } else {
//                    friendsDictionary[friendSecondNameKey] = [friendSecondName]
//                }
//        }
//        friendSectionTitles = [String](friendsDictionary.keys) // massive of keys in dictionary
//        friendSectionTitles = friendSectionTitles.sorted(by: { $0 < $1 }) // sorted by alphabet order
//        currentFriendTitle = friendSectionTitles
//        currentFriendDictionary = friendsDictionary
//        currentFriendsArray = friendSecondNames
//
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let photosFriendsController = segue.destination as? PhotosCollectionViewController{
//            if let indexPath = tableView.indexPathForSelectedRow{
//                let photoKey = friendSectionTitles [indexPath.section]
//                let friend = friendsDictionary [photoKey]
//                photosFriendsController.friendsPhotos = friend! [indexPath.row].friendPhotos
//            }
//        }
//    }
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


    // MARK: -
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "здесь идентификатор вашего контроллера", sender: tableView.cellForRow(at: indexPath))
 
/*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 }*/
