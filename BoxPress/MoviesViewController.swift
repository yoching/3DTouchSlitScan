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
        
        
        let button = UIButton(type: .infoLight)
        button.addTarget(self, action: #selector(MoviesViewController.rightBarButtonItemTapped(_:)), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    
    @objc func rightBarButtonItemTapped(_ sender: UIButton) {
        let infoVC = InfoViewController.instantiate()
        present(infoVC, animated: true, completion: nil)
    }
}


extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let movie = moviesColletionViewDataSource.movieAtIndexPath(indexPath) else {
            return
        }

        let movieViewController: MovieViewController
        if UIScreen.main.traitCollection.forceTouchCapability == .available {
            movieViewController = MovieViewControllerFor3DTouch.instantiate()
            movieViewController.movieViewViewModel = MovieViewFor3DTouchViewModel(movie: movie)
        } else {
            movieViewController = MovieViewControllerForNon3DTouch.instantiate()
            movieViewController.movieViewViewModel = MovieViewForNon3DTouchViewModel(movie: movie)
        }
        self.show(movieViewController, sender: self)
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 2) / 3
        let height = width * Movie.height / Movie.width
        return CGSize(width: width, height: height)
    }
}
