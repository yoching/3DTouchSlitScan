//
//  MovieFrameLayer.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/4/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieFrameLayer {
    let imageLayer: CALayer
    let maskLayer: ImageMaskLayer
    
    init(viewModel: MovieFrameLayerViewModel, frame: CGRect) {
        imageLayer = CALayer(image: viewModel.image, frame: frame)
        maskLayer = ImageMaskLayer(frame: frame)
        imageLayer.mask = maskLayer
        
        if let hole = viewModel.hole {
            maskLayer.openHole(center: hole.center, radius: hole.radius)
        }
        
        // binding
        viewModel.onHoleUpdated = { [weak self] hole in
            guard let hole = hole else {
                self?.maskLayer.closeHole()
                return
            }
            self?.maskLayer.openHole(center: hole.center, radius: hole.radius)
        }
    }

}