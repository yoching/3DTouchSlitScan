//
//  MoviesCollectionViewDataSource.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/26/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MoviesCollectionViewDataSource: NSObject {
    let movieCellViewModels: [MovieCellViewModel]
    init(movieCellViewModels: [MovieCellViewModel]) {
        self.movieCellViewModels = movieCellViewModels
    }
    
    func movieAtIndexPath(indexPath: NSIndexPath) -> Movie? {
        guard indexPath.row < movieCellViewModels.count else {
            return nil
        }
        return movieCellViewModels[indexPath.row].movie
    }
}

extension MoviesCollectionViewDataSource: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCellViewModels.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCell", forIndexPath: indexPath) as? MovieCell else {
            fatalError("could not dequeue cell")
        }
        cell.configure(movieCellViewModels[indexPath.row])
        return cell
    }

}
