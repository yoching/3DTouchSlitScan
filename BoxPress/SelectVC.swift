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
    case PanFace
    case RightLeft
    case Rolling
    case UpDown
    case WaveHands
    case iPhoneLock
    case openPhoto
    case mapreal
    case calendar
    case camera
    case compass
    case mapflat
    case notificationCenter
    case phone
    
    static var count: Int {
        return 15
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
        case .iPhoneLock:
            return "lock"
        case .openPhoto:
            return "openPhoto"
        case .mapreal:
            return "mapreal"
        case .calendar:
            return "calendar"
        case .camera:
            return "camera"
        case .compass:
            return "compass"
        case .mapflat:
            return "flatmap"
        case .notificationCenter:
            return "notificationCenter"
        case .phone:
            return "phone"
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
        case .iPhoneLock:
            return "iPhone Lock"
        case .openPhoto:
            return "iPhone open photo"
        case .mapreal:
            return "3d map"
        case .calendar:
            return "calendar"
        case .camera:
            return "camera"
        case .compass:
            return "compass"
        case .mapflat:
            return "flatmap"
        case .notificationCenter:
            return "notificationCenter"
        case .phone:
            return "phone"
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
