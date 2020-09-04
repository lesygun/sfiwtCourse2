//
//  NewsTableViewCell.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 01.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupIcon: UIImageView!
    @IBAction func likeCertainlyPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var newsData: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var likePressed: UIButton!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var sharePressed: UIButton!
    @IBOutlet weak var commentPressed: UIButton!
    @IBOutlet weak var viewsCount: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
