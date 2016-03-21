//
//  ImageMaskLayer.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/21/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol ImageMaskLayerType {
    func openHole(center center: CGPoint, radius: CGFloat)
    func closeHole()
}

class ImageMaskLayer: CAShapeLayer, ImageMaskLayerType {
    
    override init() {
        super.init()
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init()
        commonInit()
    }
    
    private func commonInit() {
        fillRule = kCAFillRuleEvenOdd
        fillColor = UIColor.blackColor().CGColor
    }
    
    convenience init(frame: CGRect) {
        self.init()
        self.frame = frame
        self.bounds = CGRectMake(0, 0, frame.width, frame.height)
        closeHole()
    }
    
    func openHole(center center: CGPoint, radius: CGFloat) {
        let pathWithHole = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(2.0*M_PI), clockwise: true)
        pathWithHole.appendPath(UIBezierPath(rect: bounds))
        path = pathWithHole.CGPath
    }
    
    func closeHole() {
        path = UIBezierPath(rect: bounds).CGPath
    }
}
