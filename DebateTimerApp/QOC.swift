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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Affirmative.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
