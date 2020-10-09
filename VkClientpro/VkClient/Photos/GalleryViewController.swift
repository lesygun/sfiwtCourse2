//
//  GalleryViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 11.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
    //var myFriend: Friend?
    var xZeroPositionImageView : CGFloat {
        return self.view.center.x
    }
    
    var widthImageView: CGFloat{
        return self.view.bounds.width
    }
    
    var offset: CGFloat{
        return self.view.bounds.width
    }
    
    var photoArray = [String?]()
    var indexImage = 0
    let panGesture = UIPanGestureRecognizer()
    var panGestureAnchor: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indexImage = 0
        
        print(xZeroPositionImageView)
        //guard let photoArray = myFriend?.friendPhotos else {return}
        //self.photoArray = photoArray
        
        panGesture.addTarget(self, action: #selector(onPan(_:)))
        panGesture.minimumNumberOfTouches = 1
        
        photo.image = UIImage(named: "\(String(describing: photoArray[indexImage]))")
        photo.addGestureRecognizer(panGesture)
    }
    
    @objc func onPan(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        let translation = gestureRecognizer.translation(in: view)
        
        guard let gestureView = gestureRecognizer.view else {return}
        
        switch gestureRecognizer.state {
        case .changed:
            
            gestureView.center.x += translation.x
            
            gestureRecognizer.setTranslation(.zero, in: view)
            
        case .ended:
            
            if gestureView.center.x > 0 && gestureView.center.x < offset{
                gestureView.center.x = xZeroPositionImageView
            }
            
            if gestureView.center.x < xZeroPositionImageView && indexImage + 1 == photoArray.count {
                gestureView.center.x = xZeroPositionImageView
            }
            
            if gestureView.center.x < xZeroPositionImageView && indexImage + 1 < photoArray.count {
                indexImage += 1
                movePhotoLeft(photo: gestureView)
            }
            
            if gestureView.center.x > offset && indexImage == 0 {
                gestureView.center.x = xZeroPositionImageView
            }
            
            if gestureView.center.x > offset && indexImage < photoArray.count && indexImage > 0 {
                indexImage -= 1
                movePhotoRight(photo: gestureView)
            }
            
        default: return
        }
    }
    
    func movePhotoLeft(photo: UIView) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                                photo.center.x -= self.offset
                            },
                        
                       completion: {_ in
                                    print("after +: \(photo.center.x)")
        photo.center.x = self.xZeroPositionImageView
        self.photo.image = UIImage(named: "\(String(describing: self.photoArray[self.indexImage]))")
        }
        )
    }
    
    func movePhotoRight(photo: UIView){
        print(photo.center.x)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {photo.center.x += self.offset}, completion: {_ in
                                        print("after +: \(photo.center.x)")
            photo.center.x = self.xZeroPositionImageView
            self.photo.image = UIImage(named: "\(String(describing: self.photoArray[self.indexImage]))")
        })
}
}
