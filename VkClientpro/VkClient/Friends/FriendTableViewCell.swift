//
//  FriendTableViewCell.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 06.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarCustom: AvatarCustomView!
    
    @IBOutlet weak var friendName: UILabel!
    
    @IBAction func handleTap (_ gesture: UITapGestureRecognizer){
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 0.5
        animation.stiffness = 400
        animation.mass = 1
        animation.duration = 1.5
        animation.beginTime = CACurrentMediaTime() + 0.5
        
        
        self.avatarCustom.layer.add(animation, forKey: nil)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
