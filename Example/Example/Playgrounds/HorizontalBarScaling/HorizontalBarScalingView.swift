//
//  HorizontalBarScaling.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class HorizontalBarScalingView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let lineWidth = width / 9
        
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0.5, 0.4, 0.3, 0.2, 0.1]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
        
        let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [0.9, 0.4, 0.9]
        animation.duration = 1
        animation.repeatCount = .infinity
        animation.fillMode = .backwards
        animation.isRemovedOnCompletion = false
        
        let path = UIBezierPath(
            roundedRect:
                CGRect(
                    x: 0,
                    y: 0,
                    width: lineWidth,
                    height: height
                ),
            cornerRadius: width / 2
        )
        
        for i in 0..<5 {
            let layer = CAShapeLayer()
            layer.frame = CGRect(
                x: lineWidth * 2 * CGFloat(i),
                y: 0,
                width: lineWidth,
                height: height
            )
            layer.path = path.cgPath
            layer.fillColor = UIColor.systemBlue.cgColor
            
            animation.beginTime = beginTime + beginTimes[i]
            
            layer.add(animation, forKey: "animation")
            self.layer.addSublayer(layer)
        }
        
    }
    
}
