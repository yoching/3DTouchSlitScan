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
        
        let movieViewController = MovieViewControllerFor3DTouch.instantiate()
        movieViewController.movieViewViewModel = MovieViewFor3DTouchViewModel(movie: movie)
        self.showViewController(movieViewController, sender: self)
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (UIScreen.mainScreen().bounds.width - 2) / 3
        let height = width * Movie.height / Movie.width
        return CGSize(width: width, height: height)
    }
}
