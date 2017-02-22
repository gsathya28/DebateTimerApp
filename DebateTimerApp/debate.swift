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
    
    // MARK: Constructors
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater)
    {
        name = inName
        self.affSpeakers = [Affspeaker1, Affspeaker2]
        self.negSpeakers = [Negspeaker1, Negspeaker2]
        self.rounds = [
            debateRound(inName: "Opening Statement for Affirmative - Love ", inType: "Opener", possPoints: 15),
            debateRound(inName: "Opening Statement for Negative", inType: "Opener", possPoints: 15),
            debateRound(inName: "QOC", inType: "Question", possPoints: 15),
            debateRound(inName: "RebAff", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "RebNeg", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "CloseAff", inType: "Closing", possPoints: 15),
            debateRound(inName: "CloseNeg", inType: "Closing", possPoints: 15)
        ]
    }
    
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater, Affspeaker3: debater)
    {
        name = inName
        self.affSpeakers = [Affspeaker1, Affspeaker2, Affspeaker3]
        self.negSpeakers = [Negspeaker1, Negspeaker2]
        self.rounds = [
            debateRound(inName: "Opening Statement for Affirmative - Love ", inType: "Opener", possPoints: 15),
            debateRound(inName: "Opening Statement for Negative", inType: "Opener", possPoints: 15),
            debateRound(inName: "QOC", inType: "Question", possPoints: 15),
            debateRound(inName: "RebAff", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "RebNeg", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "CloseAff", inType: "Closing", possPoints: 15),
            debateRound(inName: "CloseNeg", inType: "Closing", possPoints: 15)
        ]
    }
    
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater, NegSpeaker3: debater)
    {
        name = inName
        self.affSpeakers = [Affspeaker1, Affspeaker2]
        self.negSpeakers = [Negspeaker1, Negspeaker2, NegSpeaker3]
        self.rounds = [
            debateRound(inName: "Opening Statement for Affirmative - Love ", inType: "Opener", possPoints: 15),
            debateRound(inName: "Opening Statement for Negative", inType: "Opener", possPoints: 15),
            debateRound(inName: "QOC", inType: "Question", possPoints: 15),
            debateRound(inName: "RebAff", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "RebNeg", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "CloseAff", inType: "Closing", possPoints: 15),
            debateRound(inName: "CloseNeg", inType: "Closing", possPoints: 15)
        ]
    }
    
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater, Affspeaker3: debater, Negspeaker3: debater)
    {
        name = inName
        self.affSpeakers = [Affspeaker1, Affspeaker2, Affspeaker3]
        self.negSpeakers = [Negspeaker1, Negspeaker2, Negspeaker3]
        self.rounds = [
            debateRound(inName: "Opening Statement for Affirmative - Love ", inType: "Opener", possPoints: 15),
            debateRound(inName: "Opening Statement for Negative", inType: "Opener", possPoints: 15),
            debateRound(inName: "QOC", inType: "Question", possPoints: 15),
            debateRound(inName: "RebAff", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "RebNeg", inType: "Rebuttal", possPoints: 15),
            debateRound(inName: "CloseAff", inType: "Closing", possPoints: 15),
            debateRound(inName: "CloseNeg", inType: "Closing", possPoints: 15)
        ]
    }
    
    // MARK: Encoding (NSCoder)
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
