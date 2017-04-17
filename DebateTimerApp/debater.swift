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
    var deliveryScore: Int?
    var classtimeScore: Int?
    
    // MARK: Initializer
    init(inName: String, inStance: String)
    {
        self.name = inName
        self.stance? = inStance
    }
    
    // MARK: Encoding Required Functions
    required init(coder aDecoder: NSCoder) {
        stance = aDecoder.decodeObject(forKey: "stance") as? String
        name = (aDecoder.decodeObject(forKey: "name") as? String)!
        deliveryScore = aDecoder.decodeObject(forKey: "deliveryScore") as? Int
        classtimeScore = aDecoder.decodeObject(forKey: "classtimeScore") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stance, forKey: "stance")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(deliveryScore, forKey: "deliveryScore")
        aCoder.encode(classtimeScore, forKey: "classtimeScore")
    }

    
}
