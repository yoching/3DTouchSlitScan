//
//  MovieViewControllerFor3DTouch.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/6/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewControllerFor3DTouch: MovieViewController, StoryboardInstantiable {
    
    private var viewModel: MovieViewFor3DTouchViewModel {
        return movieViewViewModel as! MovieViewFor3DTouchViewModel
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        let touchEvent = touches.first!
        
        let point = touchEvent.locationInView(self.view)
        viewModel.onTouchMoved(point, normalizedForce: touchEvent.force / touchEvent.maximumPossibleForce)
    }

}