//
//  QuintupleDotDanceView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class QuintupleDotDanceView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let radius = width / 20
        let stroke = width / 24
        
        let startX = radius + stroke
        let startY = self.frame.size.height / 2.0
        
        let numberOfCircles = 5.0
        let circleWidth = radius * 2 + stroke
        let availableSpacing = width - (circleWidth * (numberOfCircles + 1))
        let circleSpacing = availableSpacing / numberOfCircles
        
        for i in 0..<5 {
            let x = startX + (circleWidth * CGFloat(i)) + CGFloat(i) * circleSpacing
            let center = CGPoint(x: x, y: startY)
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = UIColor.systemBlue.cgColor
            layer.lineWidth = stroke
            self.layer.addSublayer(layer)
            
            let animationGroup: CAAnimationGroup
            if i == 0 {
                let toValue = startX + (circleWidth * numberOfCircles) + circleSpacing * 2
                animationGroup = createHorizontalAnimationGroup(toValue)
            } else if i % 2 == 1 {
                animationGroup = createUpDownAnimationGroup(-height / 3)
            } else {
                animationGroup = createUpDownAnimationGroup(height / 3)
            }
            
            layer.add(animationGroup, forKey: "animation")
        }
    }
    
    private func createUpDownAnimationGroup(_ toValue: CGFloat) -> CAAnimationGroup {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.fromValue = 0
        animation.toValue = toValue
        animation.duration = 0.5
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animation]
        animationGroup.duration = 1.0
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
    private func createHorizontalAnimationGroup(_ toValue: CGFloat) -> CAAnimationGroup {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.fromValue = 0
        animation.toValue = toValue
        animation.duration = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animation]
        animationGroup.duration = 2.0
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
}
