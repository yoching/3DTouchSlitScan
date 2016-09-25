//
//  MovieViewControllerForNon3DTouch.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/7/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewControllerForNon3DTouch: MovieViewController, StoryboardInstantiable {

    fileprivate var viewModel: MovieViewForNon3DTouchViewModel {
        return movieViewViewModel as! MovieViewForNon3DTouchViewModel
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        viewModel.onTouchBegan(touches.first!.location(in: self.view))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        viewModel.onTouchMoved(touches.first!.location(in: self.view))
    }

}
