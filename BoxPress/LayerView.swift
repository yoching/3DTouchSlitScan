//
//  LayerView.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/6/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class LayerView: UIView {
    
    
    private var maskLayer: CAShapeLayer?
    
    func setup(color: UIColor) {

        let colorLayer = CALayer()
        colorLayer.frame = self.bounds
        colorLayer.backgroundColor = color.CGColor
        
        maskLayer = CAShapeLayer()
        maskLayer?.fillRule = kCAFillRuleEvenOdd
        maskLayer?.fillColor = UIColor.blackColor().CGColor
        
        closeHole()
        colorLayer.mask = maskLayer
        
        self.layer.addSublayer(colorLayer)

    }
    
    
    
    func setup(image image: UIImage) {
        
        let imageLayer = CALayer()
        imageLayer.contents = image.CGImage
        imageLayer.frame = self.bounds
        imageLayer.contentsGravity = kCAGravityResizeAspect

        maskLayer = CAShapeLayer()
        maskLayer?.fillRule = kCAFillRuleEvenOdd
        maskLayer?.fillColor = UIColor.blackColor().CGColor
        
        closeHole()
        imageLayer.mask = maskLayer
        
        self.layer.addSublayer(imageLayer)
    }

    func openHole(center center: CGPoint, radius: CGFloat) {
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(2.0*M_PI), clockwise: true)
        path.appendPath(UIBezierPath(rect: self.bounds))
        maskLayer?.path = path.CGPath
    }
    
    func closeHole() {
        maskLayer?.path = UIBezierPath(rect: self.bounds).CGPath
    }
    
}
