//
//  CircleBarSpinFade.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleBarSpinFadeView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let spacing = 3.0
        let lineWidth = (width - 4 * spacing) / 5
        let lineHeight = (height - 2 * spacing) / 3
        let containerSize = max(lineWidth, lineHeight)
        let radius = width / 2 - containerSize / 2
        
        let duration = 1.2
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [0.96, 0.84, 0.72, 0.6, 0.48, 0.36, 0.24, 0.12]
        let timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let animation = CAKeyframeAnimation(keyPath: "opacity")
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [1, 0.3, 1]
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        
        let path = UIBezierPath(
            roundedRect: CGRect(
                x: 0,
                y: 0,
                width: lineWidth,
                height: lineHeight
            ),
            cornerRadius: lineWidth / 2
        )
        
        for i in 0..<8 {
            let angle = .pi / 4 * CGFloat(i)
            
            let line = CAShapeLayer()
            let lineX = (containerSize - lineWidth) / 2
            let lineY = (containerSize - lineHeight) / 2
            line.frame = CGRect(x: lineX, y: lineY, width: lineWidth, height: lineHeight)
            line.path = path.cgPath
            line.backgroundColor = nil
            line.fillColor = UIColor.systemBlue.cgColor
            
            let container = CALayer()
            let containerX = radius * (cos(angle) + 1)
            let containerY = radius * (sin(angle) + 1)
            container.frame = CGRect(x: containerX, y: containerY, width: containerSize, height: containerSize)
            container.sublayerTransform = CATransform3DMakeRotation(.pi / 2 + angle, 0, 0, 1)
            container.addSublayer(line)
            
            animation.beginTime = beginTime - beginTimes[i]
            
            container.add(animation, forKey: "animation")
            self.layer.addSublayer(container)
        }
        
    }
    
}
