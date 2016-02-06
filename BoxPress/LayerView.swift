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
    private var holeRadius: CGFloat?
    
    func setup(color: UIColor, holeRadius: CGFloat) {

        self.holeRadius = holeRadius
        
        let colorLayer = CALayer()
        colorLayer.frame = self.bounds
        colorLayer.backgroundColor = color.CGColor
        
        maskLayer = CAShapeLayer()
        maskLayer?.fillRule = kCAFillRuleEvenOdd
        maskLayer?.fillColor = UIColor.blackColor().CGColor
        
        moveHoleCenterTo(self.center)
        
        colorLayer.mask = maskLayer
        
        self.layer.addSublayer(colorLayer)

    }
    
    func moveHoleCenterTo(point: CGPoint) {
        guard let holeRadius = holeRadius else {
            return
        }
        let path = UIBezierPath(arcCenter: point, radius: holeRadius, startAngle: 0.0, endAngle: CGFloat(2.0*M_PI), clockwise: true)
        path.appendPath(UIBezierPath(rect: self.bounds))
        maskLayer?.path = path.CGPath
    }
}
