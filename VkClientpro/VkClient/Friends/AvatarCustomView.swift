//
//  AvatarCustomView.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 26.08.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class AvatarCustomView: UIView {

    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var avatarShadow: UIView!
    
    @IBInspectable var shadowWidth : CGFloat = 3{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var opacity: Float = 0.5{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.black{
        didSet{
            setNeedsDisplay()
        }
    }
    
    func setup(){
        friendAvatar.layer.cornerRadius = 42
        friendAvatar.setNeedsDisplay()
        
        let avatarFrame = friendAvatar.frame
        avatarShadow.frame = CGRect(x: avatarFrame.origin.x, y: avatarFrame.origin.y, width: avatarFrame.width, height: avatarFrame.height)
        
        avatarShadow.layer.shadowColor = color.cgColor
        avatarShadow.layer.shadowOpacity = opacity
        avatarShadow.layer.shadowRadius = shadowWidth
        avatarShadow.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarShadow.layer.cornerRadius = 42
        avatarShadow.setNeedsDisplay()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension UIImageView{
    func load (url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
