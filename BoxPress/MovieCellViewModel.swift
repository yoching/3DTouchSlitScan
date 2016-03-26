//
//  MovieCellViewModel.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/26/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol MovieCellViewModelType {
    var image: UIImage? { get }
}

struct MovieCellViewModel: MovieCellViewModelType {
    let movie: Movie
    let image: UIImage?
    init(movie: Movie) {
        self.movie = movie
        image = movie.frameImageAtIndex(movie.numberOfFrames - 1)
    }
}
