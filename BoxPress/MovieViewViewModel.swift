//
//  MovieViewViewModel.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/21/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol MovieViewViewModelType {
    var layerViewModels: [MovieFrameLayerViewModel] { get }
    
    func onTouchMoved(point: CGPoint, normalizedForce: CGFloat)
    func onTouchEnded()
}

struct MovieViewViewModel: MovieViewViewModelType {
    
    let layerViewModels: [MovieFrameLayerViewModel]
    
    init?(movie: FrameExportableMovieType) {
        var _layerViewModels = [MovieFrameLayerViewModel]()
        for frameIndex in 0..<movie.numberOfFrames {
            guard let frameImage = movie.frameImageAtIndex(frameIndex)?.CGImage else {
                return nil
            }
            _layerViewModels.append(MovieFrameLayerViewModel(image: frameImage, hole: nil))
        }
        layerViewModels = _layerViewModels
    }

    private var countLayers: Int {
        return layerViewModels.count
    }
    
    func onTouchMoved(point: CGPoint, normalizedForce: CGFloat) {
        let slotsToOpenCount = Int(floor(normalizedForce * CGFloat(countLayers-1)))
        for i in (countLayers-slotsToOpenCount)..<countLayers {
            let radius = CGFloat(i - (countLayers-slotsToOpenCount) + 1) * Hole.minimumRadiusDifference
            layerViewModels[i].hole = Hole(center: point, radius: radius)
        }
    }
    
    func onTouchEnded() {
        for layerViewModel in layerViewModels {
            layerViewModel.hole = nil
        }
    }
    
}
