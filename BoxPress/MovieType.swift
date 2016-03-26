//
//  MovieType.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/26/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol MovieType {
    var title: String { get }
    var frameImageFileNamePrefix: String { get }
    var frameOrder: MovieFrameOrder { get }
    var orientation: MovieOrientation { get }
    var numberOfFrames: Int { get }
}
