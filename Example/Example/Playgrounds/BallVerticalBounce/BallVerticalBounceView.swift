//
//  BallVerticalBounceView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class BallVerticalBounceView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let line = CAShapeLayer()
        line.strokeColor = UIColor.systemBlue.cgColor
        line.lineWidth = self.frame.size.height / 15
        line.lineCap = .round
        line.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(line)
        
        let speed = 0.07
        
        let animationDownCurve = CAKeyframeAnimation(keyPath: "path")
        animationDownCurve.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animationDownCurve.duration = 2.1 * speed
        animationDownCurve.values = [initialCurvePath(self).cgPath, downCurvePath(self).cgPath]
        animationDownCurve.autoreverses = true
        animationDownCurve.beginTime = 2.9 * speed
        
        let animationTopCurve = CAKeyframeAnimation(keyPath: "path")
        animationTopCurve.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animationTopCurve.duration = 0.4 * speed
        animationTopCurve.values = [initialCurvePath(self).cgPath, topCurvePath(self).cgPath]
        animationTopCurve.autoreverses = true
        animationTopCurve.beginTime = 7.1 * speed
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationDownCurve, animationTopCurve]
        animationGroup.duration = 10 * speed
        animationGroup.repeatCount = .infinity
        
        line.add(animationGroup, forKey: "pathAnimation")
        line.path = initialCurvePath(self).cgPath
        
        createBallAnimation(self, speed)
        
    }
    
    private func initialCurvePath(_ view: UIView) -> UIBezierPath {
        let width = view.frame.size.width
        let height = view.frame.size.height + view.frame.size.height / 3
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addQuadCurve(to: CGPoint(x: width, y: height / 2), controlPoint: CGPoint(x: width / 2, y: height / 2))
        return path
    }
    
    private func downCurvePath(_ view: UIView) -> UIBezierPath {
        let width = view.frame.size.width
        let height = view.frame.size.height + view.frame.size.height / 3
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addQuadCurve(to: CGPoint(x: width, y: height / 2), controlPoint: CGPoint(x: width / 2, y: height / 1.3))
        return path
    }
    
    private func topCurvePath(_ view: UIView) -> UIBezierPath {
        let width = view.frame.size.width
        let height = view.frame.size.height + view.frame.size.height / 3
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addQuadCurve(to: CGPoint(x: width, y: height / 2), controlPoint: CGPoint(x: width / 2, y: height / 2.3))
        return path
    }
    
    private func createBallAnimation(_ view: UIView, _ speed: Double) {
        let width = view.frame.size.width
        let height = view.frame.size.height
        let size = width / 4
        let yPosition = height - height / 3
        
        let circle = drawCircleWith(CGSize(width: size, height: size))
        circle.frame = CGRect(x: width / 2 - size / 2, y: height / 20, width: size, height: size)
        
        let animation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.fromValue = 0
        animation.toValue = yPosition - size / 2
        animation.duration = 5.0 * speed
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        
        circle.add(animation, forKey: "animation")
        view.layer.addSublayer(circle)
    }
    
    private func drawCircleWith(_ size: CGSize) -> CALayer {
        let path = UIBezierPath()
        let radius = size.width / 4
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.strokeColor = UIColor.systemBlue.cgColor
        layer.lineWidth = size.width / 2
        layer.backgroundColor = nil
        
        return layer
    }
    
    
}
