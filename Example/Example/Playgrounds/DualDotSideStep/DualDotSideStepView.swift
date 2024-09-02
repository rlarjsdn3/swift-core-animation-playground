//
//  DualDotSideStep.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class DualDotSideStepView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let radius = width / 4
        let startX = radius
        let startY = height / 2
        let lineWidth = 3.0
        
        let hollowCircle = createCircleLayer(CGPoint(x: startX, y: startY), radius, false, self, lineWidth)
        
        let filledCircle = createCircleLayer(CGPoint(x: width - startX, y: startY), radius, true, self, lineWidth)
        
        let animationGroup1 = moveAnimationGroup(width - radius * 2)
        hollowCircle.add(animationGroup1, forKey: "animation")
        
        let animationGroup2 = moveAnimationGroup(-(width - radius * 2))
        filledCircle.add(animationGroup2, forKey: "animation")
        
        let zPositionAnimation1 = createZPositionAnimation(0, 1)
        hollowCircle.add(zPositionAnimation1, forKey: "zPositionAnimation")
        
        let zPositionAnimation2 = createZPositionAnimation(1, 0)
        filledCircle.add(zPositionAnimation2, forKey: "zPositionAnimation")
    
    }
    
    private func moveAnimationGroup(_ toValue: CGFloat) -> CAAnimationGroup {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fromValue = 0
        animation.toValue = toValue
        animation.duration = 1.0
        animation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animation]
        animationGroup.duration = 2.0
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
    private func createZPositionAnimation(
        _ fromValue: CGFloat,
        _ toValue: CGFloat
    ) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "zPosition")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 2.0
        animation.repeatCount = .infinity
        
        return animation
    }
    
    private func createCircleLayer(
        _ center: CGPoint,
        _ radius: CGFloat,
        _ filled: Bool,
        _ view: UIView,
        _ lineWidth: Double
    ) -> CAShapeLayer {
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: true
        )
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = filled ? UIColor.clear.cgColor : UIColor.red.cgColor
        layer.fillColor = filled ? UIColor.systemBlue.cgColor : UIColor.clear.cgColor
        layer.lineWidth = filled ? 0.0 : lineWidth
        layer.zPosition = filled ? 1.0 : 0.0
        self.layer.addSublayer(layer)
        
        return layer
    }
    
}
