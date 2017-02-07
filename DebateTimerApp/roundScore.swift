//
//  roundScore.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class roundScore: NSObject {
    // MARK: Properties
    var roundName: String?
    var roundPoints: Int?
    var roundPointsPossible: Int?
    
    // MARK: Initializer
    init(inName: String, inPointsPossible: Int ) {
        self.roundName = inName
        self.roundPointsPossible = inPointsPossible
    }
    
    required init(coder aDecoder: NSCoder) {
        roundName = aDecoder.decodeObject(forKey: "name") as? String
        roundPoints = aDecoder.decodeObject(forKey: "points") as? Int
        roundPointsPossible = aDecoder.decodeObject(forKey: "possPoints") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(roundPointsPossible, forKey: "possPoints")
        aCoder.encode(roundPoints, forKey: "points")
        aCoder.encode(roundName, forKey: "name")
    }

    
    // MARK: Functions
    func calculatePercent(pointsScored: Int, pointsPossible: Int) -> Double
    {
        let rawPercent: Double = Double(pointsScored) / Double(pointsPossible)
        return rawPercent
    }
    
    
}

