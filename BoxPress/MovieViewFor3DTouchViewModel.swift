//
//  MovieViewFor3DTouchViewModel.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/6/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

struct MovieViewFor3DTouchViewModel: MovieViewViewModelType {

    let layerViewModels: [MovieFrameLayerViewModel]
    
    init?(movie: FrameExportableMovieType) {
        guard let _layerViewModels = MovieViewFor3DTouchViewModel.setupLayerViewModels(movie) else {
            return nil
        }
        layerViewModels = _layerViewModels
    }
    
    func onTouchMoved(point: CGPoint, normalizedForce: CGFloat) {
        let slotsToOpenCount = Int(floor(normalizedForce * CGFloat(countLayers-1)))
        for i in (countLayers-slotsToOpenCount)..<countLayers {
            let radius = CGFloat(i - (countLayers-slotsToOpenCount) + 1) * Hole.minimumRadiusDifference
            layerViewModels[i].hole = Hole(center: point, radius: radius)
        }
    }
    
}
