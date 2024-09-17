//
//  CirclePulseSingleView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

// MARK: - View

class CirclePulseSingleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = width / 2
        
        let duration = 1.0
        
        let animationScale = CABasicAnimation(keyPath: "transform.scale")
        animationScale.duration = duration
        animationScale.fromValue = 0
        animationScale.toValue = 1
        
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.duration = duration
        animationOpacity.fromValue = 1
        animationOpacity.toValue = 0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationScale, animationOpacity]
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationGroup.duration = duration
        animationGroup.repeatCount = .infinity
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.path = path.cgPath
        layer.fillColor = UIColor.systemOrange.cgColor
        
        layer.add(animationGroup, forKey: "animationGroup")
        self.layer.addSublayer(layer)
        
    }
    
}


// MARK: - Preview

#Preview {
    CirclePulseSingleView()
}
