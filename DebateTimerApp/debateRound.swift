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
    var roundRawTime: Int? = -1
    var roundAffTime: Int? = -1
    var roundNegTime: Int? = -1
    var roundPoints: Int? = -1
    var roundAffPoints: Int? = -1
    var roundNegPoints: Int? = -1
    var roundPointsPossible: Int? = -1
    // var roundStarted: Bool = false
    
    // Initializers
    
    init(inName: String, inType: String, possPoints: Int)
    {
        self.roundName = inName
        self.roundType = inType
        self.roundPointsPossible = possPoints
        self.roundPoints = -1
        self.roundRawTime = -1
    }
    
    // Encoding Required Functions
    
    required init(coder aDecoder: NSCoder) {
        roundName = (aDecoder.decodeObject(forKey: "name") as? String)!
        roundType = (aDecoder.decodeObject(forKey: "type") as? String)!
        roundPointsPossible = aDecoder.decodeObject(forKey: "possPoints") as? Int
        roundPoints = aDecoder.decodeObject(forKey: "points") as? Int
        roundRawTime = aDecoder.decodeObject(forKey: "rawTime") as? Int
        roundAffTime = aDecoder.decodeObject(forKey: "affTime") as? Int
        roundNegTime = aDecoder.decodeObject(forKey: "negTime") as? Int
        roundAffPoints = aDecoder.decodeObject(forKey: "affQOCPoints") as? Int
        roundNegPoints = aDecoder.decodeObject(forKey: "negQOCPoints") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(roundName, forKey: "name")
        aCoder.encode(roundType, forKey: "type")
        aCoder.encode(roundPointsPossible, forKey: "possPoints")
        aCoder.encode(roundPoints, forKey: "points")
        aCoder.encode(roundRawTime, forKey: "rawTime")
        aCoder.encode(roundAffTime, forKey: "affTime")
        aCoder.encode(roundNegTime, forKey: "negTime")
        aCoder.encode(roundAffPoints, forKey: "affQOCPoints")
        aCoder.encode(roundNegPoints, forKey: "negQOCPoints")
    }

    
}
