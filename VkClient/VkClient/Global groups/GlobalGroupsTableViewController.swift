//
//  GlobalGroupsTableViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 07.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController {

    var globalGroups = [Group]()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateGroups()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func generateGroups(){
        let group1 = Group(name: "GeekBrains", icon: "Avtushenko1")
        let group2 = Group(name: "IT-capital", icon: "Ginzburg1")
        let group3 = Group(name: "Football challenge", icon: "Averkiev1")
        let group4 = Group(name: "Photo boost", icon: "Bondarenko1")
        let group5 = Group(name: "Films", icon: "Averkiev1")
        let group6 = Group(name: "NHL", icon: "Bondarenko1")
        
        globalGroups.append(group1);  globalGroups.append(group2);  globalGroups.append(group3);  globalGroups.append(group4);  globalGroups.append(group5);  globalGroups.append(group6)
        
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return globalGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupTableViewControllerCellKey", for: indexPath) as! GlobalGroupsTableViewCell

        let group = globalGroups[indexPath.row]
        
        cell.globalGroupName.text = group.name
        cell.globalGroupIcon.image = UIImage.init(named: group.icon)

        return cell
    }
   

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
