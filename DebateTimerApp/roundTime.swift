//
//  roundTime.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class roundTime: NSObject {
    // MARK: Properties
    var roundName: String?
    var roundrawTime: Int?
    var displayTimes: [String: Int]?
    
    // MARK: Initializer
    init(inName: String, inRawTime: Int)
    {
        self.roundName = inName
        self.roundrawTime = inRawTime
    }
    
    required init(coder aDecoder: NSCoder) {
        roundName = aDecoder.decodeObject(forKey: "displayTime") as? String
        roundrawTime = aDecoder.decodeObject(forKey: "rawTime") as? Int
        displayTimes = aDecoder.decodeObject(forKey: "name") as? [String: Int]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(displayTimes, forKey: "displayTime")
        aCoder.encode(roundrawTime, forKey: "rawTime")
        aCoder.encode(roundName, forKey: "name")
    }

    
    
    // MARK: Functions
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
