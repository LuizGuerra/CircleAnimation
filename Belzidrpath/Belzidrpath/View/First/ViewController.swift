//
//  ViewController.swift
//  Belzidrpath
//
//  Created by Luiz Pedro Franciscatto Guerra on 09/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import UIKit
//import CoreMotion

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = self.view.center
        self.view.backgroundColor = ApplicationColors.darkBackground
        createTrackLayer(center: center)
        createCircle(center: center)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func createCircle (center: CGPoint) {
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0
        shapeLayer.lineWidth = 10
        shapeLayer.path = circularPath.cgPath
        self.view.layer.addSublayer(shapeLayer)
    }
    
    func createTrackLayer (center: CGPoint) {
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.lineWidth = 10
        trackLayer.path = circularPath.cgPath
        self.view.layer.addSublayer(trackLayer)
    }
    
    @objc private func handleTap () {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "anythingHere")
    }


}

