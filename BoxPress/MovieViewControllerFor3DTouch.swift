//
//  MovieViewControllerFor3DTouch.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/6/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewControllerFor3DTouch: MovieViewController, StoryboardInstantiable {
    
    fileprivate var viewModel: MovieViewFor3DTouchViewModel {
        return movieViewViewModel as! MovieViewFor3DTouchViewModel
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touchEvent = touches.first!
        
        let point = touchEvent.location(in: self.view)
        viewModel.onTouchMoved(point, normalizedForce: touchEvent.force / touchEvent.maximumPossibleForce)
    }

}
