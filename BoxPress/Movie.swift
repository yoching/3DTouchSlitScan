//
//  Movie.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/19/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

struct Movie: FrameExportableMovieType {
    let title: String
    let frameImageFileNamePrefix: String
    let frameOrder: MovieFrameOrder
    let orientation: MovieOrientation
    let numberOfFrames = 72
    
    init(title: String, frameImageFileNamePrefix: String, frameOrder: MovieFrameOrder = .ascending, orientation: MovieOrientation = .vertical) {
        self.title = title
        self.frameImageFileNamePrefix = frameImageFileNamePrefix
        self.frameOrder = frameOrder
        self.orientation = orientation
    }

}

extension Movie {
    static let width: CGFloat = 375
    static let height: CGFloat = 667
}

extension Movie {
    static let movies = [
//        Movie(title: "Front-Back", frameImageFileNamePrefix: "frontback"),
//        Movie(title: "Face Panning", frameImageFileNamePrefix: "IMG_0457"),
//        Movie(title: "Right-Left", frameImageFileNamePrefix: "rightleft"),
//        Movie(title: "Rolling", frameImageFileNamePrefix: "rolling"),
//        Movie(title: "Up-Down", frameImageFileNamePrefix: "updown", frameOrder: .Descending),
//        Movie(title: "Hand Waving", frameImageFileNamePrefix: "wavehands"),

//        Movie(title: "iPhone open photo", frameImageFileNamePrefix: "openPhoto"),
//        Movie(title: "3d map", frameImageFileNamePrefix: "mapreal"), // option 2

//        Movie(title: "camera", frameImageFileNamePrefix: "camera"), // option 2

//        Movie(title: "flatmap", frameImageFileNamePrefix: "flatmap"),
//        Movie(title: "notificationCenter", frameImageFileNamePrefix: "notificationCenter"),
//        Movie(title: "phone", frameImageFileNamePrefix: "phone"), // option 2
        Movie(title: "paper", frameImageFileNamePrefix: "paper"),
        Movie(title: "write on paper", frameImageFileNamePrefix: "paper_write"),
//        Movie(title: "paper_write_crash", frameImageFileNamePrefix: "paper_write_crash"),
//        Movie(title: "babystar", frameImageFileNamePrefix: "babystar"),
        Movie(title: "books", frameImageFileNamePrefix: "books"),
        Movie(title: "bottle_lay", frameImageFileNamePrefix: "bottle_lay"),
         Movie(title: "bottle_rolling", frameImageFileNamePrefix: "bottle_rolling"),
         Movie(title: "water", frameImageFileNamePrefix: "water"),
         Movie(title: "calendar", frameImageFileNamePrefix: "calendar"),
         Movie(title: "compass", frameImageFileNamePrefix: "compass"),
         Movie(title: "iPhone Lock", frameImageFileNamePrefix: "lock")
    ]
}
