//
//  Individual_Evaluation_Neg.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 3/23/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class Individual_Evaluation_Neg: UIViewController {

    // MARK: Outlet Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Student3: UILabel!
    @IBOutlet weak var textfield5: UITextField!
    @IBOutlet weak var textfield6: UITextField!
    
    
    // MARK: Saving Properties with Debate Objects
    
    var roundCounter: Int?
    var round: debateRound?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "current") as? String
        ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
        
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
    
        textfield1.keyboardType = UIKeyboardType.numberPad
        textfield2.keyboardType = UIKeyboardType.numberPad
        textfield3.keyboardType = UIKeyboardType.numberPad
        textfield4.keyboardType = UIKeyboardType.numberPad
        textfield5.keyboardType = UIKeyboardType.numberPad
        textfield6.keyboardType = UIKeyboardType.numberPad
        
        scrollView.contentSize.height = 1150
        
        if(Speak3NegCount == 0)
        {
            Student3.isHidden = true
            Label1.isHidden = true
            Label2.isHidden = true
            textfield5.isHidden = true
            textfield6.isHidden = true
        }
        
        EvalNegspeaker1 = (currentDebate?.affSpeakers[0])!
        EvalNegspeaker2 = (currentDebate?.affSpeakers[1])!
        EvalNegspeaker1?.classtimeScore = Int(textfield1.text!)
        EvalNegspeaker2?.classtimeScore = Int(textfield3.text!)
        EvalNegspeaker1?.deliveryScore = Int(textfield2.text!)
        EvalNegspeaker2?.deliveryScore = Int(textfield4.text!)
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
    
    // Saving Function for Ind Eval - Checks both for Negative and Affirmative
    
    @IBAction func IndEvalSave(_ sender: UIButton) {
        
        currentDebate?.negSpeakers[0] = EvalNegspeaker1!
        currentDebate?.negSpeakers[1] = EvalNegspeaker2!
        
        if (Speak3AffCount == 1)
        {
            EvalNegspeaker3 = currentDebate?.negSpeakers[2]
            EvalNegspeaker3?.classtimeScore = Int(textfield5.text!)
            EvalNegspeaker3?.deliveryScore = Int(textfield6.text!)
            currentDebate?.affSpeakers[2] = EvalNegspeaker3!
        }
        /*
        if (EvalNegspeaker1?.classtimeScore == nil || EvalNegspeaker1?.deliveryScore == nil || EvalNegspeaker2?.classtimeScore == nil || EvalNegspeaker2?.deliveryScore == nil)
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
