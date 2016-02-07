//
//  ViewController.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/6/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var layers = [LayerView]()
    let countSlot = 18
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for i in 0..<countSlot {
            let layerView = LayerView()
            layerView.frame = self.view.bounds
//            layerView.setup(image: UIImage(named: String(i))!, holeRadius:  CGFloat(i) * 10)
//            layerView.setup(calculateGradient(Double(i)/Double(countSlot)), holeRadius: CGFloat(i) * 10)
            
            let number = i * 2
            let name = "IMG_0457" + ( number < 10 ? "0\(number)" : "\(number)")
            layerView.setup(image: UIImage(named: String(name))!, holeRadius: CGFloat(i) * 10, openHole: false)
            layers.append(layerView)
            self.view.addSubview(layerView)
        }
    }
    
    
    private func calculateGradient(portion: Double) -> UIColor {
        
        func mix(p1: CGFloat, p2: CGFloat) -> CGFloat {
            return p1 * CGFloat(portion) + p2 * CGFloat(1.0-portion)
        }
        
        var r1 = CGFloat(0.0)
        var g1 = CGFloat(0.0)
        var b1 = CGFloat(0.0)
        var a1 = CGFloat(0.0)
        UIColor.blueColor().getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        
        var r2 = CGFloat(0.0)
        var g2 = CGFloat(0.0)
        var b2 = CGFloat(0.0)
        var a2 = CGFloat(0.0)
        UIColor.greenColor().getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(red: mix(r1,p2: r2), green: mix(g1,p2: g2), blue: mix(b1,p2: b2), alpha: mix(a1,p2: a2))
    }
    
   
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touchEvent = touches.first!
        
        let point = touchEvent.locationInView(self.view)
        for layer in layers {
            layer.moveHoleCenterTo(point)
        }

    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touchEvent = touches.first!
        
        let point = touchEvent.locationInView(self.view)
        for layer in layers {
            layer.moveHoleCenterTo(point)
        }
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        for layer in layers {
            layer.closeHole()
        }
    }
}

