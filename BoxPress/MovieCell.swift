//
//  MovieCell.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/26/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    func configure(_ viewModel: MovieCellViewModelType) {
        thumbnailImageView.image = viewModel.image
    }
}
