//
//  SelectVC.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/7/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, StoryboardInstantiable {
   
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var moviesColletionViewDataSource: MoviesCollectionViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.dataSource = moviesColletionViewDataSource
        moviesCollectionView.delegate = self
    }
    
}

extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        guard let movie = moviesColletionViewDataSource.movieAtIndexPath(indexPath) else {
            return
        }
        
        let movieViewController = MovieViewController.instantiate()
        movieViewController.movieViewViewModel = MovieViewViewModel(movie: movie)
        self.showViewController(movieViewController, sender: self)
    }
}
