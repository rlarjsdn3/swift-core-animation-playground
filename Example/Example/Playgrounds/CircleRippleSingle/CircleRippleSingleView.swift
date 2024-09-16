//
//  CircleRippleSingleView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

// MARK: - View

class CircleRippleSingleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = width / 2
        
        let duration = 1.0
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)
        
        let animationScale = CAKeyframeAnimation(keyPath: "transform.scale")
        animationScale.keyTimes = [0, 0.7]
        animationScale.values = [0.1, 1]
        animationScale.timingFunction = timingFunction
        animationScale.duration = duration
        
        let animationOpacity = CAKeyframeAnimation(keyPath: "opacity")
        animationOpacity.keyTimes = [0, 0.5, 1]
        animationOpacity.values = [1, 0.7, 0]
        animationOpacity.timingFunctions = [timingFunction, timingFunction]
        animationOpacity.duration = duration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationScale, animationOpacity]
        animationGroup.duration = duration
        animationGroup.repeatCount = .infinity
        animationGroup.fillMode = .backwards
        animationGroup.isRemovedOnCompletion = false
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.path = path.cgPath
        layer.backgroundColor = nil
        layer.fillColor = nil
        layer.strokeColor = UIColor.systemOrange.cgColor
        layer.lineWidth = 5
        
        layer.add(animationGroup, forKey: "animationGroup")
        self.layer.addSublayer(layer)
        
    }
    
}


// MARK: - Preview

#Preview {
    CircleRippleSingleView()
}
