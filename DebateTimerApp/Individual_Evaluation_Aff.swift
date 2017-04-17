//
//  Individual_Evaluation_Aff.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 3/23/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

var EvalAffspeaker1: debater?
var EvalAffspeaker2: debater?
var EvalAffspeaker3: debater?

class Individual_Evaluation_Aff: UIViewController {
    
    // MARK: Text Outlet Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    
    // MARK: Label Outlet Properties - Third Person
    @IBOutlet weak var Student3: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    // MARK: Third Person Text Fields
    @IBOutlet weak var textfield5: UITextField!
    @IBOutlet weak var textfield6: UITextField!
    
    // MARK: Saving Variables
    let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    var currentDebate: debate?
    var roundCounter: Int?
    var round: debateRound?
    var ArchiveURLCurrent: URL?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Getting the current debate loaded
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "current") as? String
        ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
        
        // Making Sure the Keyboard is the number section (not exactly a pad)
        textfield1.keyboardType = UIKeyboardType.numberPad
        textfield2.keyboardType = UIKeyboardType.numberPad
        textfield3.keyboardType = UIKeyboardType.numberPad
        textfield4.keyboardType = UIKeyboardType.numberPad
        textfield5.keyboardType = UIKeyboardType.numberPad
        textfield6.keyboardType = UIKeyboardType.numberPad
        
        // Scroll View Setup
        scrollView.contentSize.height = 1150
        
        // Hide Textfields and Labels of third person if not present
        if(Speak3AffCount == 0)
        {
            Student3.isHidden = true
            Label1.isHidden = true
            Label2.isHidden = true
            textfield5.isHidden = true
            textfield6.isHidden = true
        }
        
        // Loading Speakers (Global) for data entry
        EvalAffspeaker1 = (currentDebate?.affSpeakers[0])!
        EvalAffspeaker2 = (currentDebate?.affSpeakers[1])!
        EvalAffspeaker1?.classtimeScore = Int(textfield1.text!)
        EvalAffspeaker2?.classtimeScore = Int(textfield3.text!)
        EvalAffspeaker1?.deliveryScore = Int(textfield2.text!)
        EvalAffspeaker2?.deliveryScore = Int(textfield4.text!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Individual Evaluation Save Function
    
    @IBAction func IndEvalSave(_ sender: Any) {
        
        currentDebate?.affSpeakers[0] = EvalAffspeaker1!
        currentDebate?.affSpeakers[1] = EvalAffspeaker2!
        
        if (Speak3AffCount == 1)
        {
            EvalAffspeaker3 = currentDebate?.affSpeakers[2]
            EvalAffspeaker3?.classtimeScore = Int(textfield5.text!)
            EvalAffspeaker3?.deliveryScore = Int(textfield6.text!)
            currentDebate?.affSpeakers[2] = EvalAffspeaker3!
        }
        /*
        if (EvalAffspeaker1?.classtimeScore == nil || EvalAffspeaker1?.deliveryScore == nil || EvalAffspeaker2?.classtimeScore == nil || EvalAffspeaker2?.deliveryScore == nil)
        {
            print("Alert goes here!")
        }

        
        if (EvalNegspeaker1?.classtimeScore == nil || EvalNegspeaker1?.deliveryScore == nil || EvalAffspeaker2?.classtimeScore == nil || EvalNegspeaker2?.deliveryScore == nil)
        {
            print("Alert goes here!")
        }
        */
        let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: (ArchiveURLCurrent?.path)!)
        
        if savedData
        {
            print("HAHAHAHAHAHA!")
        }
    }
    
    
}
