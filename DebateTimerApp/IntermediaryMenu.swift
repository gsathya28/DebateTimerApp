//
//  IntermediaryMenu.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 2/17/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class IntermediaryMenu: UIViewController {

    var roundCounter: Int?
    
    @IBOutlet var continueRegular: UIButton!
    @IBOutlet var continueQOC: UIButton!
    @IBOutlet var individualEval: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var back2: UIButton!
    @IBOutlet weak var back3: UIButton!
    
    
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        continueRegular.isEnabled = true
        continueQOC.isEnabled = false
        individualEval.isEnabled = false
        finishedLabel.isHidden = true
        
        if(roundCounter! <= 1)
        {
            back2.isHidden = true
            back3.isHidden = true
        }
        if(roundCounter! == 2)
        {
            back.isHidden = true
            back3.isHidden = true
            back2.isHidden = false
        }
        if(roundCounter! > 2)
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
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMenu(_sender: UIStoryboardSegue){
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func continueRound(_ sender: UIButton) {
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
