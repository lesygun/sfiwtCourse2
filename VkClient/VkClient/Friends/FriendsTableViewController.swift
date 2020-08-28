//
//  FriendsTableViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 06.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = [Friend]()
    
    let cruzPhotos: [String?] = ["cruz1", "cruz2", "cruz3", "cruz4"]
    let stalonePhotos: [String?] = ["stal1", "stal2", "stal3", "stal4", "stal5"]
    let maskPhotos: [String?] = ["mask1", "mask2", "mask3", "mask4", "mask5", "mask6"]
    let buninPhotos: [String?] = ["bunin1", "bunin2", "bunin3", "bunin4", "bunin5"]
    let westPhotos: [String?] = ["west1", "west2", "west3", "west4", "west5", "west6", "west7"]
    let enistonPhotos: [String?] = ["anis1", "anis2", "anis3", "anis4"]
    let cvetaevaPhotos: [String?] = ["cvet1","cvet2","cvet3"]
    let trumpPhotos: [String?] = ["trump1", "trump2", "trump3", "trump4"]
    let ahmatovaPhotos: [String?] = ["ahmat1", "ahmat2", "ahmat3", "ahmat4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateFriends()
    }

    private func generateFriends () {
        let friend1 = Friend(friendName: "Том Круз", friendAvatar: "cruz1", friendPhotos: cruzPhotos)
        let friend2 = Friend(friendName: "Сильвестр Сталлоне", friendAvatar: "stal1", friendPhotos: stalonePhotos)
        let friend3 = Friend(friendName: "Илон Маск", friendAvatar: "mask1", friendPhotos: maskPhotos)
        let friend4 = Friend(friendName: "Иван Бунин", friendAvatar: "bunin1", friendPhotos: buninPhotos)
        let friend5 = Friend(friendName: "Канье Вест", friendAvatar: "west1", friendPhotos: westPhotos)
        let friend6 = Friend(friendName: "Джэнифер Энистон", friendAvatar: "anis1", friendPhotos: enistonPhotos)
        let friend7 = Friend(friendName: "Марина Цветаева", friendAvatar: "cvet1", friendPhotos: cvetaevaPhotos)
        let friend8 = Friend(friendName: "Дональд Трамп", friendAvatar: "trump1", friendPhotos: trumpPhotos)
        let friend9 = Friend(friendName: "Анна Ахматова", friendAvatar: "ahmat1", friendPhotos: ahmatovaPhotos)
        
        friends.append(friend1); friends.append(friend2); friends.append(friend3); friends.append(friend4); friends.append(friend5); friends.append(friend6); friends.append(friend7); friends.append(friend8); friends.append(friend9)

        tableView.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCellKey", for: indexPath) as! FriendTableViewCell
        
        let friend = friends[indexPath.row]

        cell.friendName.text = friend.friendName
        cell.avatarCustom.setup()
        cell.avatarCustom.friendAvatar.image = UIImage(named: friend.friendAvatar)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photosFriendsController = segue.destination as? PhotosCollectionViewController{
            if let indexPath = tableView.indexPathForSelectedRow{
                let friend = friends[indexPath.row]
                photosFriendsController.friendsPhotos = friend.friendPhotos
            }
        }
    }
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
