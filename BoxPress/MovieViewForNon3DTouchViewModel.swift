//
//  MovieViewForNon3DTouchViewModel.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/7/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieViewForNon3DTouchViewModel: MovieViewViewModelType {
    
    let maxTimeDuration: CGFloat = 2.0
    
    var layerViewModels: [MovieFrameLayerViewModel]
    
    private let stopwatch = Stopwatch()
    
    private var holeCenter: CGPoint? {
        didSet {
            guard let holeCenter = holeCenter else {
                return
            }
            self.openHole(point: holeCenter, depth: depth)
        }
    }
    private var depth: CGFloat = 0.0 {
        didSet {
            guard let holeCenter = holeCenter else {
                return
            }
            self.openHole(point: holeCenter, depth: depth)
        }
    }
    
    init?(movie: FrameExportableMovieType) {
        guard let _layerViewModels = MovieViewFor3DTouchViewModel.setupLayerViewModels(movie) else {
            return nil
        }
        layerViewModels = _layerViewModels
        
        stopwatch.onTimeChanged = { [unowned self] (time: Double) in
            self.depth = min(CGFloat(time) / self.maxTimeDuration, 1.0)
        }
    }
    
    func onTouchBegan(point: CGPoint) {
        holeCenter = point
        stopwatch.start()
    }
    
    func onTouchMoved(point: CGPoint) {
        holeCenter = point
        stopwatch.stop()
    }
    
    func onTouchEnded() {
        stopwatch.stop()
        stopwatch.clear()
    }

}
