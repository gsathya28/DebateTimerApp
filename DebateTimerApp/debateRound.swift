//
//  debateRound.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debateRound: NSObject, NSCoding {
    var roundName: String?
    var roundType: String?
    var speakersActive: String?
    var roundrawTime: [Int]?
    var roundPoints: Int?
    var roundPointsPossible: Int?
    
    init(inName: String, inType: String, possPoints: Int, speaker: String)
    {
        self.roundName = inName
        self.roundType = inType
        self.roundPointsPossible = possPoints
        self.speakersActive = speaker
        self.roundPoints = 0
        self.roundrawTime = [0]
    }
    
    required init(coder aDecoder: NSCoder) {
        roundName = (aDecoder.decodeObject(forKey: "name") as? String)!
        roundType = (aDecoder.decodeObject(forKey: "type") as? String)!
        roundPointsPossible = aDecoder.decodeObject(forKey: "possPoints") as? Int
        speakersActive = aDecoder.decodeObject(forKey: "speakersAct") as? String
        roundPoints = aDecoder.decodeObject(forKey: "points") as? Int
        roundrawTime = aDecoder.decodeObject(forKey: "rawTime") as? [Int]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(roundName, forKey: "name")
        aCoder.encode(roundType, forKey: "type")
        aCoder.encode(roundPointsPossible, forKey: "possPoints")
        aCoder.encode(speakersActive, forKey: "speakersAct")
        aCoder.encode(roundPoints, forKey: "points")
        aCoder.encode(roundrawTime, forKey: "rawTime")
    }

    
}
