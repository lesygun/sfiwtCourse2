//
//  PhotoCollectionViewCell.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 06.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!
   // @IBOutlet weak var likeView: LikeUIView!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var countLike: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func likePressed(_ sender: Any) {
        
        if likeButton.tag == 0{
            likeButton.setImage(UIImage(named: "fillHeart"), for: .normal)
            likeButton.tag += 1
            countLike.text = "1"
        } else {
            likeButton.setImage(UIImage (named: "emptyHeart"), for: .normal)
            likeButton.tag -= 1
            countLike.text = "0"
        }
    }
    
}
