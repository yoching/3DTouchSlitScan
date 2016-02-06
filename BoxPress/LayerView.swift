//
//  LayerView.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/6/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class LayerView: UIView {

    func setup(color: UIColor, holeRadius: CGFloat) {

        let colorLayer = CALayer()
        colorLayer.frame = self.bounds
        colorLayer.backgroundColor = color.CGColor
        
        let maskLayer = CAShapeLayer()
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.fillColor = UIColor.blackColor().CGColor
        
        let path = UIBezierPath(arcCenter: self.center, radius: holeRadius, startAngle: 0.0, endAngle: CGFloat(2.0*M_PI), clockwise: true)
        path.appendPath(UIBezierPath(rect: self.bounds))
        maskLayer.path = path.CGPath
        
        colorLayer.mask = maskLayer
        
        self.layer.addSublayer(colorLayer)

    }
}
