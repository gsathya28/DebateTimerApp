//
//  debater.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debater: NSObject {
    
    // MARK: Properties
    var name: String?
    var stance: String?
    var debateTimes: [String: roundTime]?
    var debateScores: [String: roundScore]?
    
    // MARK: Initializer
    init(inName: String, inStance: String)
    {
        self.name? = inName
        self.stance? = inStance
    }
    
}
