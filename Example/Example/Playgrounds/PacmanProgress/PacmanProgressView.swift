//
//  PacmanProgressView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class PacmanProgressView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        createPacman(for: self)
        createCircle(for: self)
        
    }
    
    private func createPacman(for view: UIView) {
        
        let width = view.frame.size.width
        let size = width / 1.5
        let duration = 0.7
        let timingFunction = CAMediaTimingFunction(name: .default)
        
        let pacman = drawWith(CGSize(width: size, height: size))
        let x = (view.layer.bounds.size.width - width) / 2
        let y = (view.layer.bounds.size.height - size) / 2
        pacman.frame = CGRect(x: x, y: y, width: size, height: size)
        
        let animationStrokeStart = CAKeyframeAnimation(keyPath: "strokeStart")
        animationStrokeStart.keyTimes = [0, 0.5, 1]
        animationStrokeStart.timingFunctions = [timingFunction, timingFunction]
        animationStrokeStart.values = [0, 0.125, 0]
        animationStrokeStart.duration = duration
        
        let animationStrokeEnd = CAKeyframeAnimation(keyPath: "strokeEnd")
        animationStrokeEnd.keyTimes = [0, 0.5, 1]
        animationStrokeEnd.timingFunctions = [timingFunction, timingFunction]
        animationStrokeEnd.values = [1, 0.875, 1]
        animationStrokeEnd.duration = duration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationStrokeStart, animationStrokeEnd]
        animationGroup.duration = duration
        animationGroup.repeatCount = .infinity
        animationGroup.isRemovedOnCompletion = false
        
        pacman.add(animationGroup, forKey: "animation")
        view.layer.addSublayer(pacman)
        
    }
    
    private func createCircle(for view: UIView) {
        
        let width = view.frame.size.width
        let size = width / 6
        
        let circle = drawWith(CGSize(width: size, height: size))
        let x = (view.layer.bounds.size.width - width) / 2 + width - size
        let y = (view.layer.bounds.size.height - size) / 2
        circle.frame = CGRect(x: x, y: y, width: size, height: size)
        
        let animationTranslate = CABasicAnimation(keyPath: "transform.translation.x")
        animationTranslate.fromValue = 0
        animationTranslate.toValue = -width + size
        animationTranslate.duration = 0.7
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationTranslate]
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animationGroup.duration = 0.7
        animationGroup.repeatCount = .infinity
        
        circle.add(animationGroup, forKey: "animation")
        view.layer.addSublayer(circle)
        
    }
    
    private func drawWith(_ size: CGSize) -> CALayer {
        
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        path.addArc(
            withCenter: center,
            radius: size.width / 4,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: true
        )
        layer.fillColor = nil
        layer.strokeColor = UIColor.systemBlue.cgColor
        layer.lineWidth = size.width / 2
        
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
        
    }
    
}
