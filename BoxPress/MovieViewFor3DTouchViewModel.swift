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
        openHole(point: point, depth: normalizedForce)
    }
    
    func onTouchEnded() {
        closeHole()
    }
}
