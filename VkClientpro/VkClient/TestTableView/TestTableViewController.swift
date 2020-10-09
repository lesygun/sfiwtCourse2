//
//  TestTableViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 08.10.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class TestTableViewController: UIViewController {
    
    let rootView = TestView()
    let friend = FriendsService()
    var friendsArray = [Items]()
    var name = String()
    
    
    init() {
        super.init(nibName: .none, bundle: .none)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friend.getFriends(callback: {friend in
            
            self.friendsArray = friend.items
            self.name = friend.items[0].firstName
        })
       
    }
    
    private func setup(){
        rootView.tableView.dataSource = self
        rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    }
}

extension TestTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        let friend = friendsArray[indexPath.row]
        cell.textLabel?.text = friend.firstName
        return cell
    }
    
    
}
