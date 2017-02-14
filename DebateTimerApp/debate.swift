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
    var affSpeakers = [debater]()
    var negSpeakers = [debater]()
    var rounds = [debateRound]()
    var name: String?
    
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater)
    {
        name = inName
        self.affSpeakers = [Affspeaker1, Affspeaker2]
        self.negSpeakers = [Negspeaker1, Negspeaker2]
        self.rounds = [
            debateRound(inName: "Opening Statement for Affirmative - Love ", inType: "Opener", possPoints: 15, speaker: Affspeaker1.name!),
            debateRound(inName: "Opening Statement for Negative", inType: "Opener", possPoints: 15, speaker: Negspeaker1.name!),
            debateRound(inName: "QOC", inType: "Question", possPoints: 15, speaker: "All"),
            debateRound(inName: "RebAff", inType: "Rebuttal", possPoints: 15, speaker: Affspeaker2.name!),
            debateRound(inName: "RebNeg", inType: "Rebuttal", possPoints: 15, speaker: Negspeaker2.name!),
            debateRound(inName: "CloseAff", inType: "Closing", possPoints: 15, speaker: Affspeaker1.name!),
            debateRound(inName: "CloseNeg", inType: "Closing", possPoints: 15, speaker: Affspeaker2.name!)
        ]

    }
    
    required init(coder aDecoder: NSCoder) {
        affSpeakers = aDecoder.decodeObject(forKey: "affSpeakers") as! [debater]
        negSpeakers = aDecoder.decodeObject(forKey: "negSpeakers") as! [debater]
        rounds = aDecoder.decodeObject(forKey: "rounds") as! [debateRound]
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(affSpeakers, forKey: "affSpeakers")
        aCoder.encode(negSpeakers, forKey: "negSpeakers")
        aCoder.encode(rounds, forKey: "rounds")
        aCoder.encode(name, forKey: "name")
    }
    
}
