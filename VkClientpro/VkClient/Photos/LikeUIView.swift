//
//  LikeUIView.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 26.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class LikeUIView: UIView {

  var likeView = UIView()
  var likeLabel = UILabel()
    var likeButton = UIButton(type: .roundedRect)
    
    var stateLiked : Bool = false
    
    override func awakeFromNib() {
        let buttonSize : CGFloat = 30
        
        let viewWidth = frame.width
        let viewHeight = frame.height
        
        likeView.frame = CGRect(x: 0, y: viewHeight - buttonSize, width: viewWidth, height: buttonSize)
        likeView.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        
        likeButton.frame = CGRect(x: viewWidth-buttonSize, y: 0, width: buttonSize, height: buttonSize)
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        
        likeLabel.frame = CGRect(x: 0, y: 0, width: viewHeight - buttonSize - 5, height: buttonSize)
        likeLabel.font = UIFont.boldSystemFont(ofSize: likeLabel.font.pointSize)
        likeLabel.textAlignment = .right
        
        likeView.addSubview(likeButton)
        likeLabel.addSubview(likeLabel)
        
        addSubview(likeView)
        
        setState(stateLiked)
    }
    
    func setState (_ isLiked: Bool){
        likeButton.setTitle(isLiked ? "❤️" : "🖤", for: .normal)
        likeLabel.text = isLiked ? "1" : "0"
        likeLabel.textColor = isLiked ? UIColor.red : UIColor.black
    }
    
    @objc func likeButtonPressed(sender: UIButton){
        stateLiked.toggle()
        setState(stateLiked)
    }
}
