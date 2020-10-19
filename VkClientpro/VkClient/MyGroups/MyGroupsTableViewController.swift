//
//  MyGroupsTableViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 06.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var groups = [GroupItem]()
    var currentGroups = [GroupItem]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentGroups = groups
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        self.tableView.reloadData()
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroupUnwindSigue" {
        // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let globalGroupsController = segue.source as? GlobalGroupsTableViewController else { return }
        // Получаем индекс выделенной ячейки
            if let indexPath = globalGroupsController.tableView.indexPathForSelectedRow {
        // Получаем город по индексу
                let group = globalGroupsController.doneGroups[indexPath.row]
        // Проверяем, что такого города нет в списке
                if !groups.contains(where: {g -> Bool in
                    return group.name == g.name}) {

                    groups.append(group)
                    currentGroups = groups
                    tableView.reloadData()
                }
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewControllerCellKey", for: indexPath) as! MyGroupTableViewCell

        let group = currentGroups[indexPath.row]
        
        cell.groupName.text = group.name
        let image = group.photo200
        let url = NSURL(string: image)
        cell.groupIcon.load(url: url! as URL)
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        // Удаляем город из массива
            currentGroups.remove(at: indexPath.row)
        // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: Search Bar
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == ""{
                currentGroups = groups
                tableView.reloadData()
            } else {
                currentGroups = groups.filter({group -> Bool in
                    group.name.lowercased().contains(searchController.searchBar.text!.lowercased())
                })
                tableView.reloadData()
        }
    }
}
