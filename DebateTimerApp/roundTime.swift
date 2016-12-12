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
    
    
    
    func setDisplayTime(rawTime: Int)
    {
        if (self.roundrawTime) != nil
        {
            displayTimes?["minutes"] = self.roundrawTime! / 6000
            var remainder = self.roundrawTime! % 6000
            displayTimes?["ten-seconds"] = remainder / 1000
            remainder = remainder % 1000
            displayTimes?["seconds"] = remainder / 100
            remainder = remainder % 100
            displayTimes?["deciseconds"] = remainder / 10
            displayTimes?["centiseconds"] = remainder % 10

        }
        else
        {
            displayTimes?["minutes"] = 0
            displayTimes?["ten-seconds"] = 0
            displayTimes?["seconds"] = 0
            displayTimes?["deciseconds"] = 0
            displayTimes?["centiseconds"] = 0
        }
    }
    
}
