//
//  File.swift
//  CircularLoader
//
//  Created by Mattia Righetti on 15/08/2019.
//  Copyright © 2019 Mattia Righetti. All rights reserved.
//

import UIKit

class UICircularLayer: CAShapeLayer {
    
    private let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
    
    let progressRing: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.strokeColor = UIColor(red:0.94, green:0.20, blue:0.20, alpha:1.0).cgColor
        layer.lineWidth = 15.0
        layer.strokeStart = 0
        layer.strokeEnd = 0
        return layer
    }()
    
    private let trackRing: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineCap = .round
        layer.strokeColor = UIColor(red:0.40, green:0.29, blue:0.49, alpha:1.0).cgColor
        layer.lineWidth = 15.0
        layer.strokeStart = 0
        layer.strokeEnd = 1
        return layer
    }()
    
    let pulsingRing: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0).cgColor
        layer.lineCap = .round
        layer.strokeColor = UIColor.clear.cgColor
        layer.lineWidth = 15.0
        layer.strokeStart = 0
        layer.strokeEnd = 1
        return layer
    }()
    
    override init() {
        super.init()
        setup()
    }
    
    init(withProgressBarColor progressBarColor: UIColor, _ trackRingColor: UIColor) {
        super.init()
        setup()
        trackRing.fillColor = progressBarColor.cgColor
        trackRing.strokeColor = trackRingColor.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        progressRing.path = circularPath.cgPath
        trackRing.path = circularPath.cgPath
        pulsingRing.path = circularPath.cgPath
        addSublayer(pulsingRing)
        addSublayer(trackRing)
        addSublayer(progressRing)
        progressRing.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
    }
    
}
