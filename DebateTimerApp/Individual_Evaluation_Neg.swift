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
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
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
        ContinueButton.isEnabled = false
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
        
    @IBAction func showAlertButtonTapped(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Entered Wrong", message: "Something was entered wrong", preferredStyle: UIAlertControllerStyle.alert)
        
        // add action buttons
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "NegToMenu", sender: nil) //create segue when continue button is clicked
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert view
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func BlankAlert(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Missed score", message: "There is no score entered for one of the speakers", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert view
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func ShowAlertView(_ sender: Any) {
        //convert textfields to integers
        let text1: Int? = Int(textfield1.text!)
        let text2: Int? = Int(textfield2.text!)
        let text3: Int? = Int(textfield3.text!)
        let text4: Int? = Int(textfield4.text!)
        let text5: Int? = Int(textfield5.text!)
        let text6: Int? = Int(textfield6.text!)
        
        //call the alert view method if textfield is blank or wrong
        if(textfield6.isHidden == false)
        {
            if(textfield1.text == "" || textfield2.text == "" || textfield3.text == "" || textfield4.text == "" || textfield5.text == "" || textfield6.text == "" || text1! > 5 || text2! > 5 || text3! > 5 || text4! > 5 || text5! > 5 || text6! > 5 || text1! < 0 || text2! < 0 || text3! < 0 || text4! < 0 || text5! < 0 || text6! < 0)
            {
                showAlertButtonTapped(ContinueButton)
            }
        }
        else
        {
            if(textfield1.text == "" || textfield2.text == "" || textfield3.text == "" || textfield4.text == "" || text1! > 5 || text2! > 5 || text3! > 5 || text4! > 5 || text1! < 0 || text2! < 0 || text3! < 0 || text4! < 0)
            {
                showAlertButtonTapped(ContinueButton)
            }
        }
    }
    
    func showBlankAlert() {
        if(textfield6.isHidden == false)
        {
            if(textfield1.text == "" || textfield2.text == "" || textfield3.text == "" || textfield4.text == "" || textfield5.text == "" || textfield6.text == "")
            {
                BlankAlert(ContinueButton)
            }
        }
        else
        {
            if(textfield1.text == "" || textfield2.text == "" || textfield3.text == "" || textfield4.text == "")
            {
                BlankAlert(ContinueButton)
            }
        }
    }
    
    @IBAction func indNegEvalSave(_ sender: Any) {
        
        EvalNegspeaker1 = (currentDebate?.affSpeakers[0])!
        EvalNegspeaker2 = (currentDebate?.affSpeakers[1])!
        EvalNegspeaker1?.classtimeScore = Int(textfield1.text!)
        EvalNegspeaker2?.classtimeScore = Int(textfield3.text!)
        EvalNegspeaker1?.deliveryScore = Int(textfield2.text!)
        EvalNegspeaker2?.deliveryScore = Int(textfield4.text!)
        
        currentDebate?.negSpeakers[0] = EvalNegspeaker1!
        currentDebate?.negSpeakers[1] = EvalNegspeaker2!
        
        // Individual Evaluation Save Function
        
        if (Speak3AffCount == 1)
         {
         EvalNegspeaker3 = currentDebate?.negSpeakers[2]
         EvalNegspeaker3?.classtimeScore = Int(textfield5.text!)
         EvalNegspeaker3?.deliveryScore = Int(textfield6.text!)
         currentDebate?.affSpeakers[2] = EvalNegspeaker3!
         }
        
        let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: (ArchiveURLCurrent?.path)!)
        
        if savedData
        {
            print("HAHAHAHAHAHA!")
        }
        ContinueButton.isEnabled = true
    }

}
