//
//  IntermediaryMenu.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 2/17/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class IntermediaryMenu: UIViewController {

    // Button Properties
    @IBOutlet var continueRegular: UIButton!
    @IBOutlet var continueQOC: UIButton!
    @IBOutlet var individualEval: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var back2: UIButton!
    @IBOutlet weak var back3: UIButton!
    
    // Label Properties
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // Data Variables
    var round: debateRound?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Load Data Variables
        let defaults = UserDefaults.standard
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        print(String(describing: roundCounter))
        let id = defaults.object(forKey: "current") as? String
        ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
        currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
        
        // Set up defaults
        continueRegular.isEnabled = true
        continueQOC.isEnabled = false
        individualEval.isEnabled = false
        finishedLabel.isHidden = true
        

        // RoundCounter Checks - Do things based on Round Counter

        if (roundCounter! < 7)
        {
            round = currentDebate?.rounds[roundCounter!]
        }
        if(roundCounter! <= 1 || (roundCounter! > 2 && roundCounter! <= 6))
        {
            back.isHidden = false
            back2.isHidden = true
            back3.isHidden = true
        }
        if(roundCounter! == 2)
        {
            back.isHidden = true
            back2.isHidden = false
            back3.isHidden = true
        }
        if(roundCounter! > 6)
        {
            back.isHidden = true
            back2.isHidden = true
            back3.isHidden = false
        }
        if (roundCounter! == 1)
        {
            continueRegular.isEnabled = false
            continueQOC.isEnabled = true
        }
        if (roundCounter! == 6)
        {
            continueRegular.isEnabled = false
            continueQOC.isEnabled = false
            individualEval.isEnabled = true
            roundLabel.isHidden = true
            finishedLabel.isHidden = false
        }
        if (roundCounter! == 7)
        {
            continueRegular.isEnabled = false
            continueQOC.isEnabled = false
            individualEval.isEnabled = false
            roundLabel.isHidden = true
            finishedLabel.isHidden = false
            currentDebate?.isFinished = true
            debateArray[(currentDebate?.debateNumber)!] = currentDebate!
            let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: (ArchiveURLCurrent?.path)!)
            if savedData
            {
                print("Finished Save Success!")
            }
            if (saveDebateArray())
            {
                print("Saved Debate Array!")
                print("isFinished: ", currentDebate?.isFinished)
            }

        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMenu(_sender: UIStoryboardSegue){
        roundCounter = roundCounter! - 1
        let defaults = UserDefaults.standard
        defaults.set(roundCounter, forKey: "roundCounter")
    }
    
    @IBAction func unwindToMenuFromDebateData(_sender: UIStoryboardSegue){
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Functions that manipulate the Round Counter when button is pressed
    @IBAction func continueRound(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        roundCounter = roundCounter! + 1
        defaults.set(roundCounter, forKey: "roundCounter")
    }
    
    @IBAction func continue_Ind_Eval(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        roundCounter = roundCounter! + 1
        defaults.set(roundCounter, forKey: "roundCounter")
    }
    
    @IBAction func continueQOCRound(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        roundCounter = roundCounter! + 1
        defaults.set(roundCounter, forKey: "roundCounter")
    }
}
