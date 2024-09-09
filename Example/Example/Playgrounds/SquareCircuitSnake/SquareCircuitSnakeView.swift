//
//  SquareCircuitSnakeView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class SquareCircuitSnakeView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let space = self.frame.width / 6
        let x = self.bounds.minX + space / 2
        let y = self.bounds.minY + space / 2
        let width = self.frame.size.width - space
        let height = self.frame.size.height - space
        let containerView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        self.addSubview(containerView)
        
        squareLoadingAnimation(containerView)
    }
    
    private func squareLoadingAnimation(_ view: UIView) {
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        let timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let animationStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationStrokeEnd.timingFunction = timingFunction
        animationStrokeEnd.fromValue = 0.12
        animationStrokeEnd.toValue = 1.0
        animationStrokeEnd.duration = 1.0
        animationStrokeEnd.beginTime = 0.0
        
        let animationStrokeStart = CABasicAnimation(keyPath: "strokeStart")
        animationStrokeStart.timingFunction = timingFunction
        animationStrokeStart.fromValue = 0.0
        animationStrokeStart.toValue = 0.88
        animationStrokeStart.duration = 1.0
        animationStrokeStart.beginTime = 0.2
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationStrokeEnd, animationStrokeStart]
        animationGroup.duration = 1.2
        animationGroup.repeatCount = .infinity
        
        let radius = 3.0
        let pi = CGFloat.pi
        let pi2 = CGFloat.pi / 2
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width / 4.8, y: 0))
        path.addArc(withCenter: CGPoint(x: width - radius, y: radius), radius: radius, startAngle: -pi2, endAngle: 0, clockwise: true)
        path.addArc(withCenter: CGPoint(x: width - radius, y: height - radius), radius: radius, startAngle: 0, endAngle: pi2, clockwise: true)
        path.addArc(withCenter: CGPoint(x: radius, y: height - radius), radius: radius, startAngle: pi2, endAngle: pi, clockwise: true)
        path.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: pi, endAngle: -pi2, clockwise: true)
        path.addLine(to: CGPoint(x: width / 1.35, y: 0))
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let color = UIColor.systemBlue
        
        let layerMove = createShapeLayer(rect, path, color)
        layerMove.add(animationGroup, forKey: "animation")
        view.layer.addSublayer(layerMove)
        
        let layerBase = createShapeLayer(rect, path, color.withAlphaComponent(0.3))
        view.layer.addSublayer(layerBase)
    }
    
    private func createShapeLayer(_ rect: CGRect, _ path: UIBezierPath, _ color: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.frame = rect
        layer.path = path.cgPath
        layer.fillColor = nil
        layer.strokeColor = color.cgColor
        layer.lineWidth = rect.width / 6
        layer.lineCap = .round
        return layer
    }
    
}
