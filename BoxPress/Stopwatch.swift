//
//  Stopwatch.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 4/5/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class Stopwatch: NSObject {
    
    fileprivate let timeInterval = 0.1
    
    var onTimeChanged: ((Double) -> Void)?
    
    fileprivate var timer: Timer?

    fileprivate var time: Double = 0.0 {
        didSet {
            onTimeChanged?(time)
        }
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(Stopwatch.onTimer(_:)), userInfo: nil, repeats: true)
    }

    func stop() {
        timer?.invalidate()
    }

    func clear() {
        time = 0.0
    }
    
    
    @objc func onTimer(_ sender: Timer) {
        print("onTimer")
        time += timeInterval
    }
    
}
