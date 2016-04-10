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

    func openHole(point point: CGPoint, depth: CGFloat) {
        
        print("point: \(point), depth: \(depth)")
        let countHoleOpenLayers = Int(floor(depth * CGFloat(countLayers-1)))
        
        layerViewModels.enumerate().forEach { (element: (index: Int, layerViewModel: MovieFrameLayerViewModel)) -> () in

            if element.index < (countLayers - countHoleOpenLayers) {
                element.layerViewModel.hole = nil
            } else {
                let radius = CGFloat(element.index - (countLayers-countHoleOpenLayers) + 1) * Hole.minimumRadiusDifference
                element.layerViewModel.hole = Hole(center: point, radius: radius)
            }
        }
        
    }
    
    func closeHole() {
        layerViewModels.forEach { (layerViewModel) -> () in
            layerViewModel.hole = nil
        }
    }
}
