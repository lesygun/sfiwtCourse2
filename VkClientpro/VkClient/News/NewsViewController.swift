//
//  NewsViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 01.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
        forCellReuseIdentifier: "NewsCellKeynib")
    }
    
    @IBOutlet weak var newsTableView: UITableView!{
        didSet{
            newsTableView.dataSource = self
            newsTableView.delegate = self
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellKeynib", for: indexPath) as! NewsTableViewCell
        
        cell.likesCount?.text = "1"
        cell.viewsCount?.text = "10000"
        cell.groupIcon?.image = UIImage(named: "cruz1")
        cell.groupName?.text = "Круз Том"
        cell.newsData?.text = "13.08.2020"
        cell.newsImage?.image = UIImage(named: "bunin2")
        cell.newsText?.text = "the Table View and these items are saved in Core Data.The view will display a contacts list. Everything has worked fine but I couldn't get a search bar to work. I tried a lot but I am new to swift and this is my first app. Please tell me what should I add to my code? class ContactsViewController: UITableViewController"
        
        return cell
    }
    
    
}

extension NewsViewController: UITableViewDelegate{
    
}


