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
        self.bounds = CGRectMake(0, 0, frame.width, frame.height)
        self.contentsGravity = kCAGravityResizeAspect
    }
}
