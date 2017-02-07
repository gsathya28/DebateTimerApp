//
//  debate.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debate: NSObject, NSCoding {
    // MARK: Properties
    var speakers = [
        "Affirmative": [debater](),
        "Negative": [debater]()
    ]
    var rounds = [
        "OpenAff": debateRound(inName: "OpenAff", inType: "Opener"),
        "OpenNeg": debateRound(inName: "OpenNeg", inType: "Opener"),
        "QOC" : debateRound(inName: "QOC", inType: "Question"),
        "RebAff": debateRound(inName: "RebAff", inType: "Rebuttal" ),
        "RebNeg": debateRound(inName: "RebNeg", inType: "Rebuttal"),
        "CloseAff": debateRound(inName: "CloseAff", inType: "Closing"),
        "CloseNeg": debateRound(inName: "CloseNeg", inType: "Closing")
    ]
    
    var name: String?
    
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater)
    {
        self.speakers["Affirmative"] = [Affspeaker1, Affspeaker2]
        self.speakers["Negative"] = [Negspeaker1, Negspeaker2]
    }
    
    required init(coder aDecoder: NSCoder) {
        speakers = aDecoder.decodeObject(forKey: "speakers") as! [String : [debater]]
        rounds = aDecoder.decodeObject(forKey: "rounds") as! [String : debateRound]
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(speakers, forKey: "speakers")
        aCoder.encode(rounds, forKey: "rounds")
        aCoder.encode(name, forKey: "name")
    }
    
}
