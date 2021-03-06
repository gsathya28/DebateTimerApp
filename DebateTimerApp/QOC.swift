//
//  QOC.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 1/19/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class QOC: UIViewController {

    // UI Labels
    @IBOutlet weak var Affirmative: UILabel!
    @IBOutlet weak var Negative: UILabel!
    @IBOutlet weak var back: UIButton!
   
    // Data Save Variables
    let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    var currentDebate: debate?
    var roundCounter: Int?
    var round: debateRound?
    var ArchiveURLCurrent: URL?
    
    // Affirmative Timer Variables
    var Afftimer = Timer()
    var Affcentisecond = 0
    var Affdecisecond = 0
    var Affsecond = 0
    var Afftensecond = 0
    var Affminute = 0
    var AffrawTime = 0
    var Affsavedcentisecond = 0
    
    // Negative Timer Variables
    var Negtimer = Timer()
    var Negcentisecond = 0
    var Negdecisecond = 0
    var Negsecond = 0
    var Negtensecond = 0
    var Negminute = 0
    var negRawTime = 0
    var Negsavedcentisecond = 0
    
    //initialize buttons/labels for timers
    @IBOutlet weak var AffStart: UIButton!
    @IBOutlet weak var NegStart: UIButton!
    @IBOutlet weak var AffLabel: UILabel!
    @IBOutlet weak var NegLabel: UILabel!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var Pause: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Affirmative.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 2))
        Negative.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "current") as? String
        ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
        
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        
        currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
        
        round = currentDebate?.rounds[roundCounter!]
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        print(String(describing: roundCounter))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // Unwind
    @IBAction func unwindToQOC(_sender: UIStoryboardSegue) {
        print(String(describing: roundCounter))
    }
    
    // Timer Functions
    @IBAction func startTimer(_ sender: UIButton) {
        
        Affcentisecond = Affsavedcentisecond
        Afftimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QOC.Affaction), userInfo: nil, repeats: true)
        AffStart.isEnabled = false
        reset.isEnabled = false
        NegStart.isEnabled = true
        Negtimer.invalidate()
        Pause.isEnabled = true
    }
    
    @IBAction func StartTimerNeg(_ sender: UIButton) {
        
        Negcentisecond = Negsavedcentisecond
        Negtimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QOC.Negaction), userInfo: nil, repeats: true)
        NegStart.isEnabled = false
        reset.isEnabled = false
        AffStart.isEnabled = true
        Afftimer.invalidate()
        Pause.isEnabled = true
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
        AffrawTime += 1
        
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
        negRawTime += 1
        
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
    
    // Alter RoundCounter when going back
    @IBAction func back2menu(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        roundCounter = roundCounter! - 1
        defaults.set(roundCounter, forKey: "roundCounter")
        
    }
    
    @IBAction func a(_ sender: Any) {
        let defaults = UserDefaults.standard
        roundCounter = roundCounter! - 1
        defaults.set(roundCounter, forKey: "roundCounter")
    }
    
    // Pause Timer
    @IBAction func pauseTimer(_ sender: UIButton) {
        Afftimer.invalidate()
        Negtimer.invalidate()
        Affsavedcentisecond = Affcentisecond
        Affcentisecond = 0
        Negsavedcentisecond = Negcentisecond
        Negcentisecond = 0
        AffStart.isEnabled = true
        NegStart.isEnabled = true
        Pause.isEnabled = false
        reset.isEnabled = true
    }
    
    // Save
    @IBAction func QOCsave(_ sender: UIButton) {
        round?.roundAffTime = AffrawTime
        round?.roundNegTime = negRawTime
        currentDebate?.rounds[roundCounter!] = round!
        let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: (ArchiveURLCurrent?.path)!)
        if savedData
        {
            print("Save Success!")
        }
    }
    
}
