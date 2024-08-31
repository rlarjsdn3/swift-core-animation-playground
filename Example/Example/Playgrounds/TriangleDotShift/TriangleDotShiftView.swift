//
//  TriangleDotShiftView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class TriangleDotShiftView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let radius = width / 6
        
        var startX = radius
        var startY = radius
        
        for i in 0..<3 {
            if i == 1 {
                startX = width - radius
            } else if i == 2 {
                startX = width / 2
                startY = height - radius
            }
            
            let center = CGPoint(x: startX, y: startY)
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.systemBlue.cgColor
            self.layer.addSublayer(layer)
            
            let animatinGroup: CAAnimationGroup
            if i == 0 {
                animatinGroup = moveRightAnimationGroup(width - radius * 2)
            } else if i == 1 {
                animatinGroup = moveBottomAnimationGroup(width - radius * 2)
            } else {
                animatinGroup = moveUpAnimationGroup(width - radius * 2)
            }
            
            layer.add(animatinGroup, forKey: "animation")
        }
        
    }
    
    private func moveRightAnimationGroup(_ toValue: CGFloat) -> CAAnimationGroup {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fromValue = 0
        animation.toValue = toValue
        animation.duration = 0.6
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animation]
        animationGroup.duration = 0.6
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
    private func moveBottomAnimationGroup(_ toValue: CGFloat) -> CAAnimationGroup {
        let animationX = CABasicAnimation(keyPath: "position.x")
        animationX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationX.fromValue = 0
        animationX.toValue = -toValue / 2
        animationX.duration = 0.6
        
        let animationY = CABasicAnimation(keyPath: "position.y")
        animationY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationY.fromValue = 0
        animationY.toValue = toValue
        animationY.duration = 0.6
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationX, animationY]
        animationGroup.duration = 0.6
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
    private func moveUpAnimationGroup(_ toValue: CGFloat) -> CAAnimationGroup {
        let animationX = CABasicAnimation(keyPath: "position.x")
        animationX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationX.fromValue = 0
        animationX.toValue = -toValue / 2
        animationX.duration = 0.6
        
        let animationY = CABasicAnimation(keyPath: "position.y")
        animationY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationY.fromValue = 0
        animationY.toValue = -toValue
        animationY.duration = 0.6
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationX, animationY]
        animationGroup.duration = 0.6
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
}
