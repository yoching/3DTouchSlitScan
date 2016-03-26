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
    
    private var movie: FrameExportableMovieType
    
    init(movie: FrameExportableMovieType) {
        self.movie = movie
    }
    
    var frameImages: [CGImage]? {
        var frameImages = [CGImage]()
        for frameIndex in 0..<movie.numberOfFrames {
            guard let frameImage = movie.frameImageAtIndex(frameIndex)?.CGImage else {
                return nil
            }
            frameImages.append(frameImage)
        }
        return frameImages
    }
    
}
