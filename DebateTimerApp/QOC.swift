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
   
    
    var Afftimer = Timer()
    var Negtimer = Timer()
    // This is to keep track of each digit in the timer
    var Affcentisecond = 0
    var Affdecisecond = 0
    var Affsecond = 0
    var Afftensecond = 0
    var Affminute = 0
    
    var Negcentisecond = 0
    var Negdecisecond = 0
    var Negsecond = 0
    var Negtensecond = 0
    var Negminute = 0
    // This is different, I’m not exactly sure what this is for, looking back. I’ll look into this.
    var Affsavedcentisecond = 0
    var Negsavedcentisecond = 0
    // These are the buttons Pause, Play and Reset: HOWEVER: THESE ARE OUTLETS. When you make this code. You’re going to have to drag the button twice. Once to make it into an outlet, another time to make it into a method (down below).
    
    //initialize buttons/labels for timers
    @IBOutlet weak var AffStart: UIButton!
    @IBOutlet weak var NegStart: UIButton!
    @IBOutlet weak var AffLabel: UILabel!
    @IBOutlet weak var NegLabel: UILabel!
    @IBOutlet weak var reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Affirmative.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 2))
        Negative.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // This is the method that will run when the play button is activated. This is what I meant when you have to drag the button into the code as a button. I’ll go through each line one by one.
    
    @IBAction func startTimer(_ sender: UIButton) {
        
        Affcentisecond = Affsavedcentisecond
        Afftimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QOC.Affaction), userInfo: nil, repeats: true)
        AffStart.isEnabled = false
        reset.isEnabled = true

    }
    
    @IBAction func StartTimerNeg(_ sender: UIButton) {
        
        Negcentisecond = Negsavedcentisecond
        Negtimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QOC.Negaction), userInfo: nil, repeats: true)
        NegStart.isEnabled = false
        reset.isEnabled = true
        
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        Afftimer.invalidate()
        Negtimer.invalidate()
        Affsavedcentisecond = Affcentisecond
        Affcentisecond = 0
        Affdecisecond = 0
        Affsecond = 0
        Afftensecond = 0
        Affminute = 0
        AffLabel.text = ("00:00:00")
        NegLabel.text = ("00:00:00")
        AffStart.isEnabled = true
        NegStart.isEnabled = true
    }
    
    func Affaction()
    {
        Affcentisecond += 1
        
        if (Affcentisecond == 10)
        {
            Affcentisecond = 0
            Affdecisecond += 1
        }
        
        if (Affdecisecond == 10)
        {
            Affdecisecond = 0
            Affsecond += 1
        }
        
        if (Affsecond == 10)
        {
            Affsecond = 0
            Afftensecond += 1
        }
        
        if (Afftensecond == 6)
        {
            Afftensecond = 0
            Affminute += 1
        }
        AffLabel.text = String(Affminute) + ":" + String(Afftensecond) + String(Affsecond) +  ":" + String(Affdecisecond) + String(Affcentisecond)
        
    }
    
    func Negaction()
    {
        Negcentisecond += 1
        
        if (Negcentisecond == 10)
        {
            Negcentisecond = 0
            Negdecisecond += 1
        }
        
        if (Negdecisecond == 10)
        {
            Negdecisecond = 0
            Negsecond += 1
        }
        
        if (Negsecond == 10)
        {
            Negsecond = 0
            Negtensecond += 1
        }
        
        if (Negtensecond == 6)
        {
            Negtensecond = 0
            Negminute += 1
        }
        NegLabel.text = String(Negminute) + ":" + String(Negtensecond) + String(Negsecond) +  ":" + String(Negdecisecond) + String(Negcentisecond)

    }
    
}
