//
//  GlobalGroupsTableViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 07.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var doneGroups = [GroupsItem]()

    // search Bar
    var currentGlobalGroups = [GroupsItem]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groupsTry = GroupsService()
        
        groupsTry.getGroups(callback: {result in
            
            self.doneGroups = result.items
            self.currentGlobalGroups = self.doneGroups
            self.tableView.reloadData()
        })
        // Search Bar setup
        
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentGlobalGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupTableViewControllerCellKey", for: indexPath) as! GlobalGroupsTableViewCell

        let group = doneGroups[indexPath.row]
        
        cell.globalGroupName.text = group.name
        let image = group.photo200
        let url = NSURL(string: image)
        cell.globalGroupIcon.load(url: url! as URL)

        return cell
    }
        // MARK: Search Bar 
        func updateSearchResults(for searchController: UISearchController) {
            if searchController.searchBar.text! == ""{
                currentGlobalGroups = doneGroups
                tableView.reloadData()
            } else {
                currentGlobalGroups = doneGroups.filter({group -> Bool in
                    group.name.lowercased().contains(searchController.searchBar.text!.lowercased())
                })
                tableView.reloadData()
        }
    }
    }
