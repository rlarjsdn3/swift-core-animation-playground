//
//  CircleDotSpinFadeView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleDotSpinFadeView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        
        let spacing = 3.0
        let radius = (width - 4 * spacing) / 3.5
        let radiusX = (width - radius) / 2
        let center = CGPoint(x: radius / 2, y: radius / 2)
        
        let duration = 1.0
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [0.84, 0.72, 0.6, 0.48, 0.36, 0.24, 0.12, 0]
        
        let animationScale = CAKeyframeAnimation(keyPath: "transform.scale")
        animationScale.keyTimes = [0, 0.5, 1]
        animationScale.values = [1, 0.4, 1]
        animationScale.duration = duration
        
        let animationOpacity = CAKeyframeAnimation(keyPath: "opacity")
        animationOpacity.keyTimes = [0, 0.5, 1]
        animationOpacity.values = [1, 0.3, 1]
        animationOpacity.duration = duration
        
        let animation = CAAnimationGroup()
        animation.animations = [animationScale, animationOpacity]
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.fillMode = .backwards
        animation.isRemovedOnCompletion = false
        
        let path = UIBezierPath(arcCenter: center, radius: radius / 2, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        for i in 0..<8 {
            let angle = .pi / 4 * CGFloat(i)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.systemBlue.cgColor
            layer.backgroundColor = nil
            layer.frame = CGRect(x: radiusX * (cos(angle) + 1), y: radiusX * (sin(angle) + 1), width: radius, height: radius)
            
            animation.beginTime = beginTime - beginTimes[i]
            
            layer.add(animation, forKey: "animation")
            self.layer.addSublayer(layer)
        }
        
    }
    
}
