//
//  QOC.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 1/19/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class QOC: UIViewController {

    //Initialize objects
    @IBOutlet weak var Affirmative: UILabel!
    @IBOutlet weak var Negative: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Rotate labels
        Affirmative.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 2))
        Negative.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
