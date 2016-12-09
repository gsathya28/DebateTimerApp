//
//  roundTime.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class roundTime: NSObject {
    var roundName: String?
    var roundrawTime: Int?
    var displayTimes: [String: Int]?
    
    init(inName: String, inRawTime: Int)
    {
        self.roundName = inName
        self.roundrawTime = inRawTime
    }
    
    func displaySelfTime(rawTime: Int)
    {
        
    }
    
}
