//
//  debater.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debater: NSObject, NSCoding {
    
    // MARK: Properties
    var name: String?
    var stance: String?
    var debateScores: [String: Int]?
    var debateTimes: [String: Int]?
    
    // MARK: Initializer
    init(inName: String, inStance: String)
    {
        self.name = inName
        self.stance? = inStance
    }
    
    // MARK: Encoding
    required init(coder aDecoder: NSCoder) {
        stance = aDecoder.decodeObject(forKey: "stance") as? String
        debateScores = (aDecoder.decodeObject(forKey: "scores") as? [String: Int])!
        debateTimes = aDecoder.decodeObject(forKey: "times") as? [String: Int]!
        name = (aDecoder.decodeObject(forKey: "name") as? String)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stance, forKey: "stance")
        aCoder.encode(debateScores, forKey: "scores")
        aCoder.encode(debateTimes, forKey: "times")
        aCoder.encode(name, forKey: "name")
    }

    
}
