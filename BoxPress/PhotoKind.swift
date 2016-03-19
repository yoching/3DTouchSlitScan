//
//  PhotoKind.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/16/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import Foundation

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
    case paper
    case paperWrite
    
    static var count: Int {
        return 17
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
        case .paper:
            return "paper"
        case .paperWrite:
            return "paper_write"
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
        case .paper:
            return "paper"
        case .paperWrite:
            return "write on paper"
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
    
    var orientation: PhotoOrientation {
        switch self {
        case .paperWrite:
            return .Horizontal
        default:
            return .Vertical
        }
    }
}
