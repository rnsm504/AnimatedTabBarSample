//
//  Animation.swift
//  AnimatedTabBarSample
//
//  Created by msnr on 2017/03/04.
//  Copyright © 2017年 msnr. All rights reserved.
//

import UIKit

extension UIView {
    
    func echoImage(size: CGSize) -> UIImage{
        UIGraphicsBeginImageContext(size);
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(self.frame)
        
        let x = CGFloat(size.width/2)
        let y = CGFloat(size.height/2)
        let r = CGFloat((x/3)-10)
        
        
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
    
    
    
    func echo() {
        let layer = CAShapeLayer()
        layer.frame = self.layer.bounds
        let image = echoImage(size: self.layer.bounds.size)
        layer.contents = image.cgImage
      
        self.layer.addSublayer(layer)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock({
            layer.removeFromSuperlayer()
        })
        
        let scale : CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        scale.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        
        scale.duration = 0.5
        scale.isRemovedOnCompletion = false
        scale.fillMode = kCAFillModeForwards
        scale.toValue = NSNumber(value: 2.0)
        
        
        let opacity : CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        opacity.duration = 0.5
        opacity.isRemovedOnCompletion = false
        opacity.fillMode = kCAFillModeForwards
        opacity.fromValue = NSNumber(value: 1.0)
        opacity.toValue = NSNumber(value: 0.0)
        
        let group : CAAnimationGroup = CAAnimationGroup()
        group.beginTime = CACurrentMediaTime()
        group.animations = [scale, opacity]
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeBackwards
        
        layer.add(group, forKey: "echo")
        layer.opacity = 0.0
        CATransaction.commit()
        
    }
    
    
}
