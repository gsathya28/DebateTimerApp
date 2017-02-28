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
    var individualScore: Int?
    
    // MARK: Initializer
    init(inName: String, inStance: String)
    {
        self.name = inName
        self.stance? = inStance
    }
    
    required init(coder aDecoder: NSCoder) {
        stance = aDecoder.decodeObject(forKey: "stance") as? String
        name = (aDecoder.decodeObject(forKey: "name") as? String)!
        individualScore = aDecoder.decodeObject(forKey: "individualScore") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stance, forKey: "stance")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(individualScore, forKey: "individualScore")
    }

    
}
