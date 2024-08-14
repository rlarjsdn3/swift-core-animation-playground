//
//  CircleRippleMultipleView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleRippleMultipleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = width / 2
        
        let duration = 1.25
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0, 0.2, 0.4]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)
        
        let animationScale = CAKeyframeAnimation(keyPath: "transform.scale")
        animationScale.keyTimes = [0, 0.7]
        animationScale.timingFunction = timingFunction
        animationScale.values = [0, 1]
        animationScale.duration = duration
        
        let animationOpacity = CAKeyframeAnimation(keyPath: "opacity")
        animationOpacity.keyTimes = [0, 0.7, 1]
        animationOpacity.timingFunctions = [timingFunction, timingFunction]
        animationOpacity.values = [1, 0.7, 0]
        animationOpacity.duration = duration
        
        let animation = CAAnimationGroup()
        animation.animations = [animationScale, animationOpacity]
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.fillMode = .backwards
        animation.isRemovedOnCompletion = false
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: false
        )
        
        for i in 0..<3 {
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
            layer.path = path.cgPath
            layer.backgroundColor = nil
            layer.fillColor = nil
            layer.strokeColor = UIColor.systemBlue.cgColor
            layer.lineWidth = 3
            
            animation.beginTime = beginTime + beginTimes[i]
            
            layer.add(animation, forKey: "animation")
            self.layer.addSublayer(layer)
        }
        
    }
    
}
