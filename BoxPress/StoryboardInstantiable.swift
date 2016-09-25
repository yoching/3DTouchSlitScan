//
//  StoryboardInstantiable.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 2/14/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {}

extension StoryboardInstantiable {
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: ClassNameFromStoryboardInstantiable(Self.self), bundle: nil)
        return storyBoard.instantiateInitialViewController() as! Self
    }
}

func ClassNameFromStoryboardInstantiable(_ type: StoryboardInstantiable.Type) -> String {
    let classString = NSStringFromClass(type as! AnyClass)
    return classString.components(separatedBy: ".").last!
}



