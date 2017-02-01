//
//  roundTime.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit
import os.log

class roundTime: NSObject, NSCoding {
    // MARK: Properties
    var roundName: String?
    var roundRawTime: Int?
    var displayTimes: [String: Int]?
    
    struct PropertyKey {
        static let roundName = "roundName"
        static let roundRawTime = "roundRawTime"
        static let displayTimes = "displayTimes"
    }
    
    // MARK: Initializer
    init(inName: String, inRawTime: Int)
    {
        self.roundName = inName
        self.roundRawTime = inRawTime
    }
    
    required convenience init?(coder: NSCoder)
    {
        guard let name = coder.decodeObject(forKey: PropertyKey.roundName) as? String else {
            if #available(iOS 10.0, *) {
                os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return nil
        }
        
        let rawTime = 1
        self.init(inName: name, inRawTime: rawTime)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(roundName, forKey: PropertyKey.roundName)
        aCoder.encode(roundRawTime, forKey: PropertyKey.roundRawTime)
        aCoder.encode(displayTimes, forKey: PropertyKey.displayTimes)
    }
    
    
    // MARK: Functions
    func setDisplayTime(rawTime: Int)
    {
        if (self.roundRawTime) != nil
        {
            displayTimes?["minutes"] = self.roundRawTime! / 6000
            var remainder = self.roundRawTime! % 6000
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
