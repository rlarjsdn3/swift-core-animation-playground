//
//  CircleStrokeSpinView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleStrokeSpinView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        
        let beginTime = 0.5
        let durationStart = 1.2
        let durationEnd = 0.7
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
        
        let animationRotation = CABasicAnimation(keyPath: "transform.rotation")
        animationRotation.byValue = 2 * Float.pi
        animationRotation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        let animationStart = CABasicAnimation(keyPath: "strokeStart")
        animationStart.duration = durationStart
        animationStart.timingFunction = timingFunction
        animationStart.fromValue = 0
        animationStart.toValue = 1
        animationStart.beginTime = beginTime
        
        let animationEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationEnd.duration = durationEnd
        animationEnd.timingFunction = timingFunction
        animationEnd.fromValue = 0
        animationEnd.toValue = 1
        
        let animation = CAAnimationGroup()
        animation.animations = [animationRotation, animationEnd, animationStart]
        animation.duration = durationStart + beginTime
        animation.repeatCount = .infinity
        animation.fillMode = .backwards
        animation.isRemovedOnCompletion = false
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: width / 2,
            startAngle: -0.5 * .pi,
            endAngle: 1.5 * .pi,
            clockwise: true
        )
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.strokeColor = UIColor.systemBlue.cgColor
        layer.lineCap = .round
        layer.lineWidth = 6
        
        layer.add(animation, forKey: "animation")
        self.layer.addSublayer(layer)
    }
    
}
