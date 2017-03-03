//
//  Animation.swift
//  TabBarCenterButtonBigSample
//
//  Created by msnr on 2017/03/02.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

extension UIView {
    func pop() {
        CATransaction.begin()
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.keyTimes = [0.1, 0.05]
        animation.values = [UIColor.gray.cgColor, UIColor.lightGray.cgColor]
        //        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = CFTimeInterval(0.2)
        animation.isAdditive = true
        //        animation.repeatCount = 1
        //        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(0.1)
        self.layer.add(animation, forKey: "pop")
        CATransaction.commit()
    }


    func viewHamon(size: CGSize) -> UIImage{
        UIGraphicsBeginImageContext(size);
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(self.frame)
        
        let x = CGFloat(size.width/2)
        let y = CGFloat(size.height/2)
        let r = CGFloat((x/3)-5)
        
        
        let path : CGMutablePath = CGMutablePath()
        
        path.addArc(center: CGPoint(x:x, y:y), radius: r, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: false)
        
        context.addPath(path)
        context.setStrokeColor(self.tintColor.cgColor)
        context.setLineWidth(1)
        context.drawPath(using: CGPathDrawingMode.fillStroke)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        context.restoreGState()
        
        return image!
    }
    
    
    
    func hamon() {
        let layer = CAShapeLayer()
        layer.frame = self.layer.bounds
//        layer.position = CGPoint(x:self.frame.minX, y:self.frame.minY)
        let image = viewHamon(size: self.layer.bounds.size)
        layer.contents = image.cgImage
//        layer.backgroundColor = UIColor.green.cgColor
        
        self.layer.addSublayer(layer)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock({
            layer.removeFromSuperlayer()
        })
        
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        
        animation.duration = 0.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.toValue = NSNumber(value: 2.0)
        
        
        let animation2 : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        animation2.duration = 0.5
        animation2.isRemovedOnCompletion = false
        animation2.fillMode = kCAFillModeForwards
        animation2.fromValue = NSNumber(value: 1.0)
        animation2.toValue = NSNumber(value: 0.0)
        
        let group : CAAnimationGroup = CAAnimationGroup()
        group.beginTime = CACurrentMediaTime()
        group.animations = [animation, animation2]
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeBackwards
        
        layer.add(group, forKey: "scale")
        layer.opacity = 0.0
        CATransaction.commit()
        
    }
    
    
    func rotate() {
        CATransaction.begin()
        
        
        let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.x")
        rotationAnimation.toValue = CGFloat(M_PI / 180) * 360
        rotationAnimation.duration = 0.5
        rotationAnimation.repeatCount = 1

        self.layer.add(rotationAnimation, forKey: "rotate")
        CATransaction.commit()
        
    }


    func rotate2(i: UIImage) {
   
        let layer = CAShapeLayer()
//        layer.frame = CGRect(x: 50, y: 10, width: 30, height: 30)
        layer.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        layer.contents = i.cgImage

        let backLayer = CAShapeLayer()
        backLayer.frame = CGRect(x: 40, y: 0, width: 50, height: 50)
        backLayer.backgroundColor = UIColor.groupTableViewBackground.cgColor
        
//        backLayer.backgroundColor = UIColor.black.cgColor
        
        let backView = UIView(frame: CGRect(x: 50, y: 0, width: 50, height: 60))
        backView.backgroundColor = UIColor.gray
        
        self.addSubview(backView)
//        self.layer.addSublayer(backLayer)
        backView.layer.addSublayer(layer)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
//            backLayer.removeFromSuperlayer()
//            backView.removeFromSuperview()
        }
        
        let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.x")
        rotationAnimation.toValue = CGFloat(M_PI / 180) * 360
        rotationAnimation.duration = 0.5
        rotationAnimation.repeatCount = 1
        
        layer.add(rotationAnimation, forKey: "rotate")
        CATransaction.commit()
        
    }


    func rotate3() {
        CATransaction.begin()
        
        let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.x")
        rotationAnimation.toValue = CGFloat(M_PI / 180) * 360
        rotationAnimation.duration = 0.5
        rotationAnimation.repeatCount = 1
        
        CATransaction.commit()
        
    }

}
