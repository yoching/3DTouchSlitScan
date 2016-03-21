//
//  MovieViewController.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/14/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieViewViewModel: MovieViewViewModelType!

    var imageMaskLayers = [ImageMaskLayer]()
    
    let holeRadiusTimes:CGFloat = 5
    
    @IBOutlet weak var movieView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backDidTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for index in 0..<movieViewViewModel.numberOfFrames {
            
            guard let image = movieViewViewModel.frameImageAtIndex(index)?.CGImage else {
                continue
            }

            let imageLayer = CALayer(image: image, frame: movieView.bounds)
            
            let maskLayer = ImageMaskLayer(frame: movieView.bounds)
            imageLayer.mask = maskLayer

            movieView.layer.addSublayer(imageLayer)
            imageMaskLayers.append(maskLayer)
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touchEvent = touches.first!
        
        let point = touchEvent.locationInView(self.view)
        
        let slotsToOpenCount = Int(floor((touchEvent.force / touchEvent.maximumPossibleForce) * CGFloat(movieViewViewModel.numberOfFrames-1)))
        for i in (movieViewViewModel.numberOfFrames-slotsToOpenCount)..<movieViewViewModel.numberOfFrames {
            let radius = CGFloat(i - (movieViewViewModel.numberOfFrames-slotsToOpenCount) + 1) * holeRadiusTimes
            imageMaskLayers[i].openHole(center: point, radius: radius)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        for layer in imageMaskLayers {
            layer.closeHole()
        }
    }

}

extension MovieViewController: StoryboardInstantiable {}
