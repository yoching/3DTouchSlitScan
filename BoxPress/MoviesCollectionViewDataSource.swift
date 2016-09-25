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
    
    func movieAtIndexPath(_ indexPath: IndexPath) -> Movie? {
        guard (indexPath as NSIndexPath).row < movieCellViewModels.count else {
            return nil
        }
        return movieCellViewModels[(indexPath as NSIndexPath).row].movie
    }
}

extension MoviesCollectionViewDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            fatalError("could not dequeue cell")
        }
        cell.configure(movieCellViewModels[(indexPath as NSIndexPath).row])
        return cell
    }

}
