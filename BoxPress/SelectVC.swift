//
//  SelectVC.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/7/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class SelectVC: UIViewController {
    
}

extension SelectVC: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhotoKind.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = PhotoKind(rawValue: indexPath.row)?.title
        return cell
    }
}

extension SelectVC: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let photoKind = PhotoKind(rawValue: indexPath.row) else {
            return
        }
        let vc = PhotoVC.instantiate()
        vc.photoKind = photoKind
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
