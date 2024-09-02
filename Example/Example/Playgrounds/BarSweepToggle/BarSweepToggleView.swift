//
//  BarSweepToggleView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class BarSweepToggleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let border = 5.0
        let duration = 0.9
        let heightBar = height / 6
        let widthBar = width - heightBar / 2
        
        let pathBar = UIBezierPath()
        pathBar.move(to: CGPoint(x: heightBar / 2, y: height / 2))
        pathBar.addLine(to: CGPoint(x: widthBar / 2, y: height / 2))
        
        let layerBar = CAShapeLayer()
        layerBar.path = pathBar.cgPath
        layerBar.strokeColor = UIColor.systemBlue.cgColor
        layerBar.lineWidth = heightBar
        layerBar.lineCap = .round
        self.layer.addSublayer(layerBar)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = duration
        animationGroup.autoreverses = true
        animationGroup.repeatCount = .infinity
        
        let animationStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationStrokeEnd.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationStrokeEnd.fromValue = 0.0
        animationStrokeEnd.toValue = 1.0
        animationStrokeEnd.duration = duration / 2
        
        let animationStrokeStart = CABasicAnimation(keyPath: "strokeStart")
        animationStrokeStart.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationStrokeStart.fromValue = 0.0
        animationStrokeStart.toValue = 1.0
        animationStrokeStart.duration = duration / 2
        animationStrokeStart.beginTime = duration / 2
        
        animationGroup.animations = [animationStrokeStart, animationStrokeEnd]
        layerBar.add(animationGroup, forKey: "group")
        
        let animationPosition = CABasicAnimation(keyPath: "transform.translation.x")
        animationPosition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationPosition.fromValue = 0
        animationPosition.toValue = widthBar / 2
        animationPosition.duration = duration
        animationPosition.autoreverses = true
        animationPosition.repeatCount = .infinity
        layerBar.add(animationPosition, forKey: "position")
        
        let frame = CGRect(
            x: -border,
            y: (height - heightBar) / 2 - border,
            width: width + 2 * border,
            height: heightBar + 2 * border
        )
        let pathBorder = UIBezierPath(roundedRect: frame, cornerRadius: height)
        
        let layerBorder = CAShapeLayer()
        layerBorder.path = pathBorder.cgPath
        layerBorder.fillColor = UIColor.clear.cgColor
        layerBorder.strokeColor = UIColor.systemBlue.cgColor
        layerBorder.lineWidth = border
        self.layer.addSublayer(layerBorder)
        
    }
    
}
