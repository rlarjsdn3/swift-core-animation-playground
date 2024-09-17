//
//  CircleStrokeSpinView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

// MARK: - View

class CircleStrokeSpinView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let center = CGPoint(x: width / 2, y: height / 2)
        
        let durationStart = 1.2
        let durationEnd = 0.8
        
        let beginTime = 0.4
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 0, 0.2, 1)
        
        let animationRotation = CABasicAnimation(keyPath: "transform.rotation")
        animationRotation.duration = durationStart + beginTime
        animationRotation.byValue = 2 * CGFloat.pi
        animationRotation.timingFunction = timingFunction
        
        let animationStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationStrokeEnd.duration = durationEnd
        animationStrokeEnd.timingFunction = timingFunction
        animationStrokeEnd.fromValue = 0
        animationStrokeEnd.toValue = 1
        
        let animationStrokeStart = CABasicAnimation(keyPath: "strokeStart")
        animationStrokeStart.duration = durationStart
        animationStrokeStart.timingFunction = timingFunction
        animationStrokeStart.fromValue = 0
        animationStrokeStart.toValue = 1
        animationStrokeStart.beginTime = beginTime
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationRotation, animationStrokeStart, animationStrokeEnd]
        animationGroup.duration = durationStart + beginTime
        animationGroup.repeatCount = .infinity
        animationGroup.isRemovedOnCompletion = false
        
        let path = UIBezierPath(arcCenter: center, radius: width / 2, startAngle: -0.5 * .pi, endAngle: 1.5 * .pi, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.strokeColor = UIColor.systemOrange.cgColor
        layer.lineWidth = 5
        
        layer.add(animationGroup, forKey: "animationGroup")
        self.layer.addSublayer(layer)
        
    }
    
}


// MARK: - Preview

#Preview {
    CircleStrokeSpinView()
}
