//
//  TimerPageGUI.swift
//  DebateTimerApp
//
//  Created by FLAUM, JACOB on 12/16/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit



class TimePageGUI: UIViewController {
    
    
    @IBOutlet var counterlabel: UILabel!
    var timer = Timer()
    var centisecond = 0
    var decisecond = 0
    var second = 0
    var tensecond = 0
    var minute = 0
    var savedcentisecond = 0
    
    @IBOutlet var start: UIButton!
    @IBOutlet var reset: UIButton!
    @IBOutlet var pause: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        centisecond = savedcentisecond
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(TimePageGUI.action), userInfo: nil, repeats: true)
        start.isEnabled = false;
        pause.isEnabled = true;
        reset.isEnabled = false;
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        timer.invalidate()
        savedcentisecond = centisecond
        centisecond = 0;
        start.isEnabled = true;
        reset.isEnabled = true;
        pause.isEnabled = false;
        
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        centisecond = 0
        decisecond = 0
        second = 0
        tensecond = 0
        minute = 0
        counterlabel.text = ("0:00:00")
        start.isEnabled = true;
        pause.isEnabled = true;
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
        
        counterlabel.text = String(minute) + ":" + String(tensecond) + String(second) +  ":" + String(decisecond) + String(centisecond)
        
    }
    
}

