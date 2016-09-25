//
//  MovieFrameExportable.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/26/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol FrameExportableMovieType: MovieType {
    func frameImageAtIndex(_ index: Int) -> UIImage?
}

extension FrameExportableMovieType {
    func frameImageAtIndex(_ index: Int) -> UIImage? {
        let frameIndex: Int
        switch frameOrder {
        case .descending:
            frameIndex = index
        case .ascending:
            frameIndex = numberOfFrames - 1 - index
        }
        
        let fileName = frameImageFileNamePrefix + String(format: "%02d", frameIndex)
        
        switch orientation {
        case .vertical:
            return UIImage(named: fileName)
            
        case .horizontal:
            return UIImage(named: String(fileName))?.imageRotatedByDegrees(90, flip: false)
        }
    }
}
