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
    
    var randomPhotos = ["Ginzburg1", "Antonyk1", "Sheludko1", "Averkiev1", "Zheronkin1", "Bezmenov1"] //Сделал массив для того, чтобы просто впихнуть одни и те же фотографии в collection view
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateFriends()
    }

    private func generateFriends () {
        let friend1 = Friend(friendName: "Автушенко Денис", friendAvatar: "Avtushenko1", friendPhotos: randomPhotos)
        let friend2 = Friend(friendName: "Гинзбург Марк", friendAvatar: "Ginzburg1", friendPhotos: randomPhotos)
        let friend3 = Friend(friendName: "Антонюк Борис", friendAvatar: "Antonyk1", friendPhotos: randomPhotos)
        let friend4 = Friend(friendName: "Стас Шелудько", friendAvatar: "Sheludko1", friendPhotos: randomPhotos)
        let friend5 = Friend(friendName: "Аверкиев Елисей", friendAvatar: "Averkiev1", friendPhotos: randomPhotos)
        let friend6 = Friend(friendName: "Жеронкин Родион", friendAvatar: "Zheronkin1", friendPhotos: randomPhotos)
        let friend7 = Friend(friendName: "Безменов Артем", friendAvatar: "Bezmenov1", friendPhotos: randomPhotos)
        let friend8 = Friend(friendName: "Бондаренко Григорий", friendAvatar: "Bondarenko1", friendPhotos: randomPhotos)
        let friend9 = Friend(friendName: "Ахромеева Лиана", friendAvatar: "Akhromeeva1", friendPhotos: randomPhotos)
        
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
        cell.friendAvatar.image = UIImage.init(named: friend.friendAvatar)
        
        return cell
    }
    
    // MARK: - Table view delegate  Пытался передать информацию с одного экрана на следующий, но не получилось.
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PhotosCollectionViewController {
            if segue.identifier == "SigueToPhotosKey" {
                dest.friendsPhotos = friends[0].friendPhotos))
            }
        }
    }
 */
    /*UIImageView.init(image: UIImage.init(named: friends[0].friendAvatar))
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
