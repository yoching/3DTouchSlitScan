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
    func onTouchEnded()
}

extension MovieViewViewModelType {
    
    func onTouchEnded() {
        layerViewModels.forEach { (layerViewModel) -> () in
            layerViewModel.hole = nil
        }
    }
    
    // common methods
    
    static func setupLayerViewModels(movie: FrameExportableMovieType) -> [MovieFrameLayerViewModel]? {
        var _layerViewModels = [MovieFrameLayerViewModel]()
        for frameIndex in 0..<movie.numberOfFrames {
            guard let frameImage = movie.frameImageAtIndex(frameIndex)?.CGImage else {
                return nil
            }
            _layerViewModels.append(MovieFrameLayerViewModel(image: frameImage, hole: nil))
        }
        return _layerViewModels
    }
    
    var countLayers: Int {
        return layerViewModels.count
    }

}
