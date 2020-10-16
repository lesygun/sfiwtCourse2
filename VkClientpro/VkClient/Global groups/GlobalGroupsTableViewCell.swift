//
//  GlobalGroupsTableViewCell.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 07.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class GlobalGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var globalGroupName: UILabel!
    
    @IBOutlet weak var globalGroupIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
