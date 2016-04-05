//
//  Hole.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/31/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

struct Hole {
    let center: CGPoint
    let radius: CGFloat
}

extension Hole {
    static let minimumRadiusDifference: CGFloat = 5.0
}
