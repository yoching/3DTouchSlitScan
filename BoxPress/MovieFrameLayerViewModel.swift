//
//  LayerViewModel.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/31/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol MovieFrameLayerViewModelType {
    var image: CGImage { get }
    var hole: Hole? { get }
    var onHoleUpdated: ((Hole?) -> Void)? { get set }
}

class MovieFrameLayerViewModel: MovieFrameLayerViewModelType {
    
    let image: CGImage
    var hole: Hole? {
        didSet {
            onHoleUpdated?(hole)
        }
    }

    var onHoleUpdated: ((Hole?) -> Void)?
    
    init(image: CGImage, hole: Hole?) {
        self.image = image
        self.hole = hole
    }

}
