//
//  SelectVC.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/7/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
   
    @IBOutlet weak var moviesTableView: UITableView!
    
    let moviesTableViewDataSource = MoviesTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = moviesTableViewDataSource
        moviesTableView.delegate = self
    }
    
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let movie = moviesTableViewDataSource.movieAtIndexPath(indexPath) else {
            return
        }

        let movieViewController = MovieViewController.instantiate()
        movieViewController.movieViewViewModel = MovieViewViewModel(movie: movie)
        self.showViewController(movieViewController, sender: self)
    }
}
