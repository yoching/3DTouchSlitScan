//
//  Movie.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/19/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

struct Movie {
    let title: String
    let frameImageFileNamePrefix: String
    let frameOrder: MovieFrameOrder
    let orientation: MovieOrientation
    
    init(title: String, frameImageFileNamePrefix: String, frameOrder: MovieFrameOrder = .Ascending, orientation: MovieOrientation = .Vertical) {
        self.title = title
        self.frameImageFileNamePrefix = frameImageFileNamePrefix
        self.frameOrder = frameOrder
        self.orientation = orientation
    }
}

extension Movie {
    static let movies = [
        Movie(title: "Front-Back", frameImageFileNamePrefix: "frontback"),
        Movie(title: "Face Panning", frameImageFileNamePrefix: "IMG_0457"),
        Movie(title: "Right-Left", frameImageFileNamePrefix: "rightleft"),
        Movie(title: "Rolling", frameImageFileNamePrefix: "rolling"),
        Movie(title: "Up-Down", frameImageFileNamePrefix: "updown", frameOrder: .Descending),
        Movie(title: "Hand Waving", frameImageFileNamePrefix: "wavehands"),
        Movie(title: "iPhone Lock", frameImageFileNamePrefix: "lock"),
        Movie(title: "iPhone open photo", frameImageFileNamePrefix: "openPhoto"),
        Movie(title: "3d map", frameImageFileNamePrefix: "mapreal"),
        Movie(title: "calendar", frameImageFileNamePrefix: "calendar"),
        Movie(title: "camera", frameImageFileNamePrefix: "camera"),
        Movie(title: "compass", frameImageFileNamePrefix: "compass"),
        Movie(title: "flatmap", frameImageFileNamePrefix: "flatmap"),
        Movie(title: "notificationCenter", frameImageFileNamePrefix: "notificationCenter"),
        Movie(title: "phone", frameImageFileNamePrefix: "phone"),
        Movie(title: "paper", frameImageFileNamePrefix: "paper"),
        Movie(title: "write on paper", frameImageFileNamePrefix: "paper_write", orientation: .Horizontal)
    ]
}
