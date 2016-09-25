//
//  CALayerExtension.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 3/21/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

extension CALayer {
    convenience init(image: CGImage, frame: CGRect) {
        self.init()
        self.contents = image
        self.frame = frame
        self.bounds = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        self.contentsGravity = kCAGravityResizeAspect
    }
}
