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
    var speakersActive: [debater]?
    var roundrawTime: Int?
    var displayTimes: [String: Int]?
    var roundPoints: Int?
    var roundPointsPossible: Int?
    
    init(inName: String, inType: String, possPoints: Int)
    {
        self.roundName = inName
        self.roundType = inType
        self.roundPointsPossible = possPoints
        
    }
    
    required init(coder aDecoder: NSCoder) {
        roundName = (aDecoder.decodeObject(forKey: "name") as? String)!
        roundType = (aDecoder.decodeObject(forKey: "type") as? String)!
        speakersActive = aDecoder.decodeObject(forKey: "speakersAct") as? [debater]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(roundName, forKey: "name")
        aCoder.encode(roundType, forKey: "type")
        aCoder.encode(speakersActive, forKey: "speakersAct")
    }

    
}
