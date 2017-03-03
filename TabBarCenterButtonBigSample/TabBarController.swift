//
//  TabBarController.swift
//  TabBarCenterButtonBigSample
//
//  Created by msnr on 2017/02/12.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class CustomeTabBarController : UITabBarController {
    
    var secondItemImageView: UIImageView!
    var button : UIButton!
    
    override func viewDidLoad() {
        self.CenterButtonWithUIButton()
        self.view.tintColor = UIColor.purple
    }
    
    func CenterButtonWithUIButton() {
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = UIColor.gray
        button.titleLabel?.text = "button"
        button.addTarget(self, action: #selector(menuButtonAction), for: UIControlEvents.touchUpInside)
        button.layer.cornerRadius = button.frame.height/2
        button.layer.masksToBounds = true
        
//        let img = UIImage(named: "animal-footprint.png")
//        
//        button.setBackgroundImage(img, for: UIControlState.normal)
        
        button.center = self.tabBar.center;
        
        self.view.addSubview(button)
        
        
//        let rightView = UIView(frame : CGRect(x: self.tabBar.center, y: self.tabBar.frame.minY, width: 100, height: 100))
//        rightView.backgroundColor = UIColor.green
//        self.view.addSubview(rightView)
    }
    
    
    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 1
        

//        let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
//        rotationAnimation.toValue = CGFloat(M_PI / 180) * 360
//        rotationAnimation.duration = 0.5
//        rotationAnimation.repeatCount = 1
//        
//        sender.layer.add(rotationAnimation, forKey: "rotate")
        
        sender.hamon()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
        if self.selectedIndex == item.tag {
//            print(self.selectedIndex)
            return
        }
        
        let v = item.value(forKey: "view") as! UIView
        
        v.hamon()
        
//        if item.tag == 1 {
//            let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
//            rotationAnimation.toValue = CGFloat(M_PI / 180) * 360
//            rotationAnimation.duration = 0.5
//            rotationAnimation.repeatCount = 1
//            
//            button.layer.add(rotationAnimation, forKey: "rotate")
//            
//        }
//        
        if item.tag == 0 {
            
            let v = item.value(forKey: "view") as! UIView            
            let i = item.image
            
            
            v.rotate2(i:i!)
            
        }
    }
}
