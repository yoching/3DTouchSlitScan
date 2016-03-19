//
//  MoviesTableDataSource.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/19/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class MoviesTableViewDataSource: NSObject {
    
    let movies = Movie.movies
    
    func movieAtIndexPath(indexPath: NSIndexPath) -> Movie? {
        guard indexPath.row < movies.count else {
            return nil
        }
        return movies[indexPath.row]
    }
    
}


// MARK: - UITableViewDataSource

extension MoviesTableViewDataSource: UITableViewDataSource {
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }

}
