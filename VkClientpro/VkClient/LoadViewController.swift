//
//  LoadViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 03.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {
    @IBOutlet weak var circleOne: UIImageView!
    @IBOutlet weak var circleTwo: UIImageView!
    @IBOutlet weak var circleThree: UIImageView!
    @IBAction func circlePressed(_ sender: Any) {
        
        
        let animationOne = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animationOne.beginTime = CACurrentMediaTime() + 0.5
        animationOne.fromValue = 1
        animationOne.toValue = 0
        animationOne.duration = 1.5
        animationOne.repeatDuration = 15
        circleOne.layer.add(animationOne, forKey: nil)
        
        let animationTwo = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animationTwo.beginTime = CACurrentMediaTime()
        animationTwo.fromValue = 1
        animationTwo.toValue = 0
        animationTwo.duration = 1.5
        animationTwo.repeatDuration = 15
        circleTwo.layer.add(animationTwo, forKey: nil)
        
        let animationThree = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animationThree.beginTime = CACurrentMediaTime() + 1
        animationThree.fromValue = 1
        animationThree.toValue = 0
        animationThree.duration = 1.5
        animationThree.repeatDuration = 15
        circleThree.layer.add(animationThree, forKey: nil)
    }
    
    @IBAction func handleTap (_ gesture: UITapGestureRecognizer){
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 0.5
        animation.stiffness = 400
        animation.mass = 1
        animation.duration = 1.5
        animation.beginTime = CACurrentMediaTime() + 0.5
        
        
        self.circleThree.layer.add(animation, forKey: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
