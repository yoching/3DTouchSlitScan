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

enum PhotoKind: Int {
    case FrontBack = 0
    case PanFace = 1
    case RightLeft = 2
    case Rolling = 3
    case UpDown = 4
    case WaveHands = 5
    
    static var count: Int {
        return 6
    }
    
    var fileName: String {
        switch self {
        case .FrontBack:
            return "frontback"
        case .PanFace:
            return "IMG_0457"
        case .RightLeft:
            return "rightleft"
        case .Rolling:
            return "rolling"
        case .UpDown:
            return "updown"
        case .WaveHands:
            return "wavehands"
        }
    }
    
    var title: String {
        switch self {
        case .FrontBack:
            return "Front-Back"
        case .PanFace:
            return "Face Panning"
        case .RightLeft:
            return "Right-Left"
        case .Rolling:
            return "Rolling"
        case .UpDown:
            return "Up-Down"
        case .WaveHands:
            return "Hand Waving"
        }
    }
    
    var reverse: Bool {
        switch self {
        case .UpDown:
            return true
        default:
            return false
        }
    }
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
