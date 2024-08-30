//
//  CircleRotateChaseView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleRotateChaseView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center1 = CGPoint(x: width / 2, y: height / 2)
        
        let spacing = 3.0
        let radius = (width - 4 * spacing) / 4
        let center2 = CGPoint(x: radius / 2, y: radius / 2)
        
        let duration = 1.5
        
        let path1 = UIBezierPath(
            arcCenter: center1,
            radius: radius * 2,
            startAngle: 1.5 * .pi,
            endAngle: 3.5 * .pi,
            clockwise: true
        )
        let path2 = UIBezierPath(
            arcCenter: center2,
            radius: radius / 2,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: false
        )
        
        for i in 0..<5 {
            let rate = Float(i) * 1 / 5
            let fromScale = 1 - rate
            let toScale = 0.2 + rate
            
            let animationScale = CABasicAnimation(keyPath: "transform.scale")
            animationScale.duration = duration
            animationScale.repeatCount = .infinity
            animationScale.fromValue = fromScale
            animationScale.toValue = toScale
            
            let animationPosition = CAKeyframeAnimation(keyPath: "position")
            animationPosition.duration = duration
            animationPosition.repeatCount = .infinity
            animationPosition.path = path1.cgPath
            
            let animation = CAAnimationGroup()
            animation.animations = [animationScale, animationPosition]
            animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0.15 + rate, 0.25, 1)
            
            animation.duration = duration
            animation.repeatCount = .infinity
            animation.isRemovedOnCompletion = false
            
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: 0, y: 0, width: radius, height: radius)
            layer.path = path2.cgPath
            layer.fillColor = UIColor.systemBlue.cgColor
            
            layer.add(animation, forKey: "animation")
            self.layer.addSublayer(layer)
        }
        
    }
    
}
