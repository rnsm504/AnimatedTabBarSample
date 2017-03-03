//
//  CustomeTabBarController.swift
//  AnimatedTabBarSample
//
//  Created by msnr on 2017/03/04.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

class CustomeTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if self.selectedIndex == item.tag {
            return
        }
        
        let v = item.value(forKey: "view") as! UIView
        
        v.echo()
    }
    
}
