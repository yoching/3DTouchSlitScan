//
//  MovieViewControllerForNon3DTouch.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/7/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewControllerForNon3DTouch: MovieViewController, StoryboardInstantiable {

    private var viewModel: MovieViewForNon3DTouchViewModel {
        return movieViewViewModel as! MovieViewForNon3DTouchViewModel
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        viewModel.onTouchBegan(touches.first!.locationInView(self.view))
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        viewModel.onTouchMoved(touches.first!.locationInView(self.view))
    }

}
