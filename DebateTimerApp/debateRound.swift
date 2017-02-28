//
//  debateRound.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debateRound: NSObject, NSCoding {
    // MARK: Properties
    var roundName: String?
    var roundType: String?
    var roundRawTime: Int
    var roundPoints: Int?
    var roundPointsPossible: Int?
    
    // MARK: Initializers
    init(inName: String, inType: String, possPoints: Int)
    {
        self.roundName = inName
        self.roundType = inType
        self.roundPointsPossible = possPoints
        self.roundPoints = 0
        self.roundRawTime = 0
    }
    
    // MARK: Encoding (NSCoder)
    required init(coder aDecoder: NSCoder) {
        roundName = (aDecoder.decodeObject(forKey: "name") as? String)!
        roundType = (aDecoder.decodeObject(forKey: "type") as? String)!
        roundPointsPossible = aDecoder.decodeObject(forKey: "possPoints") as? Int
        roundPoints = aDecoder.decodeObject(forKey: "points") as? Int
        roundRawTime = (aDecoder.decodeObject(forKey: "rawTime") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(roundName, forKey: "name")
        aCoder.encode(roundType, forKey: "type")
        aCoder.encode(roundPointsPossible, forKey: "possPoints")
        aCoder.encode(roundPoints, forKey: "points")
        aCoder.encode(roundRawTime, forKey: "rawTime")
    }

    
}
