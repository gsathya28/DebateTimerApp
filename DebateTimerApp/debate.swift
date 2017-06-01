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
    var isFinished: Bool?
    var hour: Int?
    var hourString: String?
    
    var debateNumber: Int?
    
    // Initializers - based on the number of debaters
    
    init(inName: String, Affspeaker1: debater, Affspeaker2: debater, Negspeaker1: debater, Negspeaker2: debater, hourString: String)
    {
        name = inName
        self.affSpeakers = [Affspeaker1, Affspeaker2]
        self.negSpeakers = [Negspeaker1, Negspeaker2]
        self.rounds = [
            debateRound(inName: "Opening Statement for Affirmative", inType: "Aff", possPoints: 15),
            debateRound(inName: "Opening Statement for Negative", inType: "Neg", possPoints: 15),
            debateRound(inName: "Questions Of Clarification", inType: "Quest", possPoints: 5),
            debateRound(inName: "Rebuttal Affirmative", inType: "Aff", possPoints: 15),
            debateRound(inName: "Rebuttal Negative", inType: "Neg", possPoints: 15),
            debateRound(inName: "Closing Statements Affirmative", inType: "Aff", possPoints: 15),
            debateRound(inName: "Closing Statements Negative", inType: "Neg", possPoints: 15)
        ]
        self.hourString = hourString
        let numberString: String = (hourString.substring(from: hourString.endIndex))
        self.hour = Int(numberString)
    }
    
    required init(coder aDecoder: NSCoder) {
        affSpeakers = aDecoder.decodeObject(forKey: "affSpeakers") as! [debater]
        negSpeakers = aDecoder.decodeObject(forKey: "negSpeakers") as! [debater]
        rounds = aDecoder.decodeObject(forKey: "rounds") as! [debateRound]
        name = aDecoder.decodeObject(forKey: "name") as? String
        hourString = aDecoder.decodeObject(forKey: "hourString") as? String
        hour = aDecoder.decodeObject(forKey: "hour") as? Int
        debateNumber = aDecoder.decodeObject(forKey: "debateNumber") as? Int
        isFinished = aDecoder.decodeObject(forKey: "isFinished") as? Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(affSpeakers, forKey: "affSpeakers")
        aCoder.encode(negSpeakers, forKey: "negSpeakers")
        aCoder.encode(rounds, forKey: "rounds")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(hourString, forKey: "hourString")
        aCoder.encode(hour, forKey: "hour")
        aCoder.encode(debateNumber, forKey: "debateNumber")
        aCoder.encode(isFinished, forKey: "isFinished")
    }
    
    
    // Function that spits out an array of Strings that will be displayed in Table View
    
    func spitScoresArray() -> [String]
    {
        var scoresArray: [String] = []
        for index in 1...(self.rounds.count)
        {
            let ScoreString: String = self.rounds[index-1].roundName!
            scoresArray.append(ScoreString)
        }
        return scoresArray
    }
    
}
