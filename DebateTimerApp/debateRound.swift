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
    
}
