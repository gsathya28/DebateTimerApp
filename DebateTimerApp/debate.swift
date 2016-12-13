//
//  debate.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class debate: NSObject {
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
    
    
    
    
    init()
    {
        
    }
    
}
