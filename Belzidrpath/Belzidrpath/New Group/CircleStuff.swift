//
//  CircleStuff.swift
//  Belzidrpath
//
//  Created by Luiz Pedro Franciscatto Guerra on 11/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import UIKit

class CircleStuff {
    
    var fillColor: CGColor
    var strokeColor: CGColor
    var strokeSize: CGFloat
    var radius: CGFloat
    
    init(fillColor: UIColor, strokeColor: UIColor, strokeSize: CGFloat, radius: CGFloat) {
        self.fillColor = fillColor.cgColor
        self.strokeColor = strokeColor.cgColor
        self.strokeSize = strokeSize
        self.radius = radius
    }
    
    func createCircle (position: CGPoint, strokeEndPosition: CGFloat = 0) -> CAShapeLayer {
        
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: position, radius: self.radius, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        
        shapeLayer.fillColor = self.fillColor
        shapeLayer.strokeColor = self.strokeColor
//        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = strokeEndPosition
        shapeLayer.lineWidth = self.strokeSize
        shapeLayer.path = circularPath.cgPath
        
        return shapeLayer
        
    }
    
    func createTrackLayer (position: CGPoint) -> CAShapeLayer {
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: position, radius: self.radius, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.lineWidth = self.strokeSize
        trackLayer.path = circularPath.cgPath
        
        return trackLayer
        
    }
    
    func animateToCreation (layer: CAShapeLayer) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        layer.add(basicAnimation, forKey: "anythingHere")
    }
    
    func animateToCompletion (layer: CAShapeLayer) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        layer.add(basicAnimation, forKey: "anythingHere")
    }
    
}
