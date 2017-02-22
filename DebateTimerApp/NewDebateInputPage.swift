//
//  NewDebateInputPage.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 12/8/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit


class NewDebateInputPage: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
    {

// MARK: Outlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var debateName: UITextField!
    @IBOutlet weak var speak1Aff: UITextField!
    @IBOutlet weak var speak2Aff: UITextField!
    @IBOutlet weak var speak1Neg: UITextField!
    @IBOutlet weak var speak2Neg: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: Unwind Segues
    
    @IBAction func unwindToNewDebateInputPage(_sender: UIStoryboardSegue) {
    }
    
// MARK: PickerView Data and Functions
    var pickerData = ["Hour 1", "Hour 2", "Hour 3", "Hour 4", "Hour 5", "Hour 6", "Hour 7"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }


// MARK: Create New Debate (Button Sender - Creates New debate, debateRound, debater objects)
    
    @IBAction func createDebate(_ sender: UIButton) {
        
        // Enters in an array whether the textboxes are entered
        let enteredText =
            [speak1Aff.text,
             speak2Aff.text,
             speak1Neg.text,
             speak2Neg.text,
             debateName.text]
        
        // Initialize debaters
        let Aff1 = debater(inName: enteredText[0]!, inStance: "Aff")
        Aff1.debateScores = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        Aff1.debateTimes = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        
        let Aff2 = debater(inName: enteredText[1]!, inStance: "Aff")
        Aff2.debateScores = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        Aff2.debateTimes = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        
        let Neg1 = debater(inName: enteredText[2]!, inStance: "Neg")
        Neg1.debateScores = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        Neg1.debateTimes = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        
        let Neg2 = debater(inName: enteredText[3]!, inStance: "Neg")
        Neg2.debateScores = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        Neg2.debateTimes = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "RebAff" : 0, "Individual" : 0]
        
        // Initalize debate (debateRounds are automatically created in debate initializer - see debate.swift)
        let currentDebate = debate(inName: debateName.text!, Affspeaker1: Aff1, Affspeaker2: Aff2, Negspeaker1: Neg1, Negspeaker2: Neg2)
        
        // Create UserDefaults instance
        let defaults = UserDefaults.standard
        
        // Save Key to access debate later
        defaults.set(debateName.text, forKey: "current")
        
        // Save debate for persistence
        let savedData = NSKeyedArchiver.archivedData(withRootObject: currentDebate)
        defaults.set(savedData, forKey: debateName.text!)
        
        // Set roundCounter to zero - to start off the debate!
        defaults.set(0, forKey: "roundCounter")
    }
    
}
