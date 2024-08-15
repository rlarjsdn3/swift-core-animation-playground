//
//  CirclePulseMultipleView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CirclePulseMultipleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = width / 2
        
        let duration = 1.0
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0, 0.3, 0.6]
        
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.duration = duration
        animationScale.fromValue = 0
        animationScale.toValue = 1
        
        let animationOpacity = CAKeyframeAnimation(keyPath: "opacity")
        animationOpacity.duration = duration
        animationOpacity.keyTimes = [0, 0.1, 1]
        animationOpacity.values = [0, 1, 0]
        
        let animation = CAAnimationGroup()
        animation.animations = [animationScale, animationOpacity]
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
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
            layer.fillColor = UIColor.systemBlue.cgColor
            layer.opacity = 0
            
            animation.beginTime = beginTime + beginTimes[i]
            
            layer.add(animation, forKey: "animation")
            self.layer.addSublayer(layer)
        }
        
    }
    
}
