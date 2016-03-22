//
//  MovieViewViewModel.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/21/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol MovieViewViewModelType {
    var frameImages: [CGImage]? { get }
}

struct MovieViewViewModel: MovieViewViewModelType {
    
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var frameImages: [CGImage]? {
        var frameImages = [CGImage]()
        for frameIndex in 0..<movie.numberOfFrames {
            guard let frameImage = frameImageAtIndex(frameIndex)?.CGImage else {
                return nil
            }
            frameImages.append(frameImage)
        }
        return frameImages
    }
    
    private func frameImageAtIndex(index: Int) -> UIImage? {
        
        let frameIndex: Int
        switch movie.frameOrder {
        case .Descending:
            frameIndex = index
        case .Ascending:
            frameIndex = movie.numberOfFrames - 1 - index
        }
        
        let fileName = movie.frameImageFileNamePrefix + String(format: "%02d", frameIndex)
        
        switch movie.orientation {
        case .Vertical:
            return UIImage(named: fileName)
            
        case .Horizontal:
            return UIImage(named: String(fileName))?.imageRotatedByDegrees(90, flip: false)
        }

    }
}
