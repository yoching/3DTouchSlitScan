//
//  PhotoVC.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/14/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController {
    
    var layers = [LayerView]()
    let countSlot = 72
    let holeRadiusTimes:CGFloat = 5
    
    var movie: Movie!
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backDidTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for i in 0..<countSlot {
            let layerView = LayerView()
            layerView.frame = self.view.bounds
            //            layerView.setup(image: UIImage(named: String(i))!, holeRadius:  CGFloat(i) * 10)
            //            layerView.setup(calculateGradient(Double(i)/Double(countSlot)), holeRadius: CGFloat(i) * 10)
            
            let number: Int
            switch movie.frameOrder {
            case .Descending:
                number = i
            case .Ascending:
                number = countSlot - 1 - i
            }
            
            let lowerName: String
            if number < 10 {
                lowerName = "0\(number)"
            } else if number < 100 {
                lowerName = "\(number)"
            } else {
                lowerName = "\(number)"
            }
            //            let name = "IMG_0457" + lowerName
            //            let name = "IMG_0468" + (number < 10 ? "0\(number)" : "\(number)")
            //            let name = "IMG_0460" + (number < 10 ? "0\(number)" : "\(number)")
            //            let name = "updown" + lowerName
            let name = movie.frameImageFileNamePrefix + lowerName
            
            switch movie.orientation {
            case .Vertical:
                layerView.setup(image: UIImage(named: String(name))!)
                
            case .Horizontal:
                let originalImage = UIImage(named: String(name))!
                layerView.setup(image: originalImage.imageRotatedByDegrees(90, flip: false))
            }
            
            layers.append(layerView)
            self.view.insertSubview(layerView, belowSubview: backButton)
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
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touchEvent = touches.first!
        
        let point = touchEvent.locationInView(self.view)
        
        let slotsToOpenCount = Int(floor((touchEvent.force / touchEvent.maximumPossibleForce) * CGFloat(countSlot-1)))
        for i in (countSlot-slotsToOpenCount)..<countSlot {
            let radius = CGFloat(i - (countSlot-slotsToOpenCount) + 1) * holeRadiusTimes
            layers[i].openHole(center: point, radius: radius)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        for layer in layers {
            layer.closeHole()
        }
    }

}

extension PhotoVC: StoryboardInstantiable {}
