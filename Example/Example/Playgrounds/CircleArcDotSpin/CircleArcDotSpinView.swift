//
//  CircleArcDotSpinView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleArcDotSpinView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let space = self.frame.width / 8
        let x = self.bounds.minX + space / 2
        let y = self.bounds.minY + space / 2
        let width = self.frame.width - space
        let height = self.frame.height - space
        let containerView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        self.addSubview(containerView)
        
        let center = CGPoint(x: containerView.bounds.midX, y: containerView.bounds.midY)
        let radius = containerView.frame.width / 2
        let count = 8
        let duration = 4.0
        let size = radius / 3
        
        for i in 0..<count {
            let angle = (CGFloat(i) / CGFloat(count)) * (2 * .pi)
            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)
            
            let circle = UIView(frame: CGRect(x: x - size / 2, y: y - size / 2, width: size, height: size))
            circle.backgroundColor = UIColor.systemBlue
            circle.layer.cornerRadius = size / 2
            containerView.addSubview(circle)
            
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: angle, endAngle: angle + 2 * .pi, clockwise: true).cgPath
            animation.duration = duration
            animation.repeatCount = .infinity
            animation.calculationMode = .paced
            circle.layer.add(animation, forKey: "circleAnimation")
        }
        
        animateArcRotation(containerView)
        
    }
    
    private func animateArcRotation(_ view: UIView) {
        let width = view.frame.size.width
        let height = view.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        
        let animationRotation = CABasicAnimation(keyPath: "transform.rotation")
        animationRotation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationRotation.byValue = 4 * Double.pi
        animationRotation.duration = 1.6
        
        let animationStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationStrokeEnd.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationStrokeEnd.fromValue = 0.5
        animationStrokeEnd.toValue = 1
        animationStrokeEnd.duration = 0.8
        animationStrokeEnd.autoreverses = true
        animationStrokeEnd.isRemovedOnCompletion = false
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationRotation, animationStrokeEnd]
        animationGroup.duration = 1.6
        animationGroup.repeatCount = .infinity
        animationGroup.fillMode = .forwards
        
        let path = UIBezierPath(arcCenter: center, radius: width / 2, startAngle: -.pi / 2, endAngle: 0, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.strokeColor = UIColor.systemBlue.cgColor
        layer.lineWidth = view.frame.size.width / 6
        layer.lineCap = .round
        
        layer.add(animationGroup, forKey: "animation")
        view.layer.addSublayer(layer)
    }
    
}
