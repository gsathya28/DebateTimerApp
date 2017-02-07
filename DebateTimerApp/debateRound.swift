//
//  debateRound.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debateRound: NSObject {
    var roundName: String?
    var roundType: String?
    var speakersActive: [String: debater]?
    
    init(inName: String, inType: String)
    {
        self.roundName = inName
        self.roundType = inType
    }
    
    required init(coder aDecoder: NSCoder) {
        roundName = aDecoder.decodeObject(forKey: "speakersAct") as? String
        roundType = aDecoder.decodeObject(forKey: "type") as? String
        speakersActive = aDecoder.decodeObject(forKey: "name") as? [String: debater]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(speakersActive, forKey: "speakersAct")
        aCoder.encode(roundType, forKey: "type")
        aCoder.encode(roundName, forKey: "name")
    }

    
}
