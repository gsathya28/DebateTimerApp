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
    
    // UI Outlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var debateName: UITextField!
    @IBOutlet weak var Speak3Neg: UITextField!
    @IBOutlet weak var speak1Aff: UITextField!
    @IBOutlet weak var speak2Aff: UITextField!
    @IBOutlet weak var Speak3Aff: UITextField!
    @IBOutlet weak var speak1Neg: UITextField!
    @IBOutlet weak var speak2Neg: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var DebateTopic: UITextField!
    
    // Data Save Directory
    let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    // Picker Data
    var pickerData = ["Hour 1", "Hour 2", "Hour 3", "Hour 4", "Hour 5", "Hour 6", "Hour 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize.height = 1150

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Picker Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Unwind Function Prep
    @IBAction func unwindToNewDebateInputPage(_sender: UIStoryboardSegue) {
    }
    
    
    // New Debate Creation
    @IBAction func createDebate(_ sender: UIButton) {
        // Enters in an array whether the textboxes are entered
        let enteredText =
            [speak1Aff.text,
             speak2Aff.text,
             speak1Neg.text,
             speak2Neg.text,
             debateName.text]
        
        let Aff1 = debater(inName: enteredText[0]!, inStance: "Aff")
        let Aff2 = debater(inName: enteredText[1]!, inStance: "Aff")
        let Neg1 = debater(inName: enteredText[2]!, inStance: "Neg")
        let Neg2 = debater(inName: enteredText[3]!, inStance: "Neg")
        
        let defaults = UserDefaults.standard
        defaults.set(debateName.text, forKey: "current")
        
        let selectedHourNumber = pickerView.selectedRow(inComponent: 0)
        let hourString = pickerData[selectedHourNumber]
        currentDebate = debate(inName: debateName.text!, Affspeaker1: Aff1, Affspeaker2: Aff2, Negspeaker1: Neg1, Negspeaker2: Neg2, hourString: hourString)
        
        if(Speak3Aff.text == "" && Speak3Neg.text == "")
        {
            Speak3AffCount = 0
            Speak3NegCount = 0
        }
        else if (Speak3Neg.text == "")
        {
            Speak3AffCount = 1
            Speak3NegCount = 0
            let Aff3 = debater(inName: Speak3Aff.text!, inStance: "Aff")
            currentDebate?.affSpeakers = [Aff1, Aff2, Aff3]
        }
        else if(Speak3Aff.text == "")
        {
            Speak3AffCount = 0
            Speak3NegCount = 1
            let Neg3 = debater(inName: Speak3Neg.text!, inStance: "Neg")
            currentDebate?.negSpeakers = [Neg1, Neg2, Neg3]
        }
        else
        {
            Speak3AffCount = 1
            Speak3NegCount = 1
            let Aff3 = debater(inName: Speak3Aff.text!, inStance: "Aff")
            let Neg3 = debater(inName: Speak3Neg.text!, inStance: "Neg")
            currentDebate?.affSpeakers = [Aff1, Aff2, Aff3]
            currentDebate?.negSpeakers = [Neg1, Neg2, Neg3]
        }
        
        // Really Important Save!
        
        let ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(debateName.text!)
        
        let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: ArchiveURLCurrent.path)
        if savedData
        {
            print("Debate Saved!")
        }
        defaults.set(0, forKey: "roundCounter")
        
        debateArray.append(currentDebate!)
        saveDebateArray()
 
    }
    
    @IBAction func showAlertButtonTapped(_ sender: Any) {
        // create the alert
        var alert: UIAlertController?
        
        if (DebateTopic.text == "")
        {
            alert = UIAlertController(title: "Missing Information!", message: "You didn't enter the debate name!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            
        }
        else if (speak1Aff.text == "" || speak2Aff.text == "" || speak1Neg.text == "" || speak2Neg.text == "")
        {
            alert = UIAlertController(title: "Missing Information!", message: "You didn't enter the speaker names", preferredStyle: UIAlertControllerStyle.alert)
            
            alert?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        }
        else if(Speak3Aff.text == "" || Speak3Neg.text == "")
        {
            alert = UIAlertController(title: "Missing Information!", message: "You didn't enter the 3rd speaker names (Optional)", preferredStyle: UIAlertControllerStyle.alert)
            
            alert?.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { (action) in alert?.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "MenuToTimer", sender: nil) //create segue when continue button is clicked
            }))
            alert?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            
        }
        else
        {
            alert = UIAlertController(title: "Missing Information!", message: "Something went wrong!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        }
        
        // show the alert view
        self.present(alert!, animated: true, completion: nil)
    }
        
    @IBAction func ShowAlertView(_ sender: Any) {
       
        //call the alert view method if textfield is blank or wrong
        if(speak1Aff.text == "" || speak2Aff.text == "" || Speak3Aff.text == "" || speak1Neg.text == "" || speak2Neg.text == "" || Speak3Neg.text == "" || DebateTopic.text == "" )
        {
            showAlertButtonTapped(continueButton)
        }
    }
 
}
