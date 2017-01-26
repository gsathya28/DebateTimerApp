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
   
    
    var timer = Timer()
    // This is to keep track of each digit in the timer
    var centisecond = 0
    var decisecond = 0
    var second = 0
    var tensecond = 0
    var minute = 0
    // This is different, I’m not exactly sure what this is for, looking back. I’ll look into this.
    var savedcentisecond = 0
    
    // These are the buttons Pause, Play and Reset: HOWEVER: THESE ARE OUTLETS. When you make this code. You’re going to have to drag the button twice. Once to make it into an outlet, another time to make it into a method (down below).
    
    
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
        
        centisecond = savedcentisecond
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QOC.action), userInfo: nil, repeats: true)
        AffStart.isEnabled = false;

    }
    
    @IBAction func StartTimerNeg(_ sender: UIButton) {
        
        centisecond = savedcentisecond
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QOC.action), userInfo: nil, repeats: true)
        NegStart.isEnabled = false;
        
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        timer.invalidate()
        savedcentisecond = centisecond
        centisecond = 0
        decisecond = 0
        second = 0
        tensecond = 0
        minute = 0
        AffLabel.text = ("00:00:00")
        NegLabel.text = ("00:00:00")
        AffStart.isEnabled = true
        NegStart.isEnabled = true
    }
    
    func action()
    {
        centisecond += 1
        
        if (centisecond == 10)
        {
            centisecond = 0
            decisecond += 1
        }
        
        if (decisecond == 10)
        {
            decisecond = 0
            second += 1
        }
        
        if (second == 10)
        {
            second = 0
            tensecond += 1
        }
        
        if (tensecond == 6)
        {
            tensecond = 0
            minute += 1
        }
        
        AffLabel.text = String(minute) + ":" + String(tensecond) + String(second) +  ":" + String(decisecond) + String(centisecond)
        
    }
    
}
