//
//  NewDebateInputPage.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 12/8/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit


class NewDebateInputPage: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate
    {
    
    @IBOutlet weak var speak1Neg: UITextField!
    
    
    var keyboardHeight: Int = 0
    
    var pickerData = ["Hour 1", "Hour 2", "Hour 3", "Hour 4", "Hour 5", "Hour 6", "Hour 7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        speak1Neg.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewDebateInputPage.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewDebateInputPage.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification)
    {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        self.keyboardHeight = Int(keyboardRectangle.height)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -(CGFloat(keyboardHeight)))
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        self.keyboardHeight = Int(keyboardRectangle.height)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: (CGFloat(keyboardHeight)))
    }

    
    //Hello! Test Commit!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    
    
    @IBAction func createDebate(_ sender: UIButton) {
        /*
        // Enters in an arry whether the textboxes are entered
        let enteredText =
            [speak1Aff.text,
             speak2Aff.text,
             speak1Neg.text,
             speak2Neg.text,
             debateName.text]
        
        let Aff1 = debater(inName: enteredText[0]!, inStance: "Aff")
        Aff1.debateScores = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "Individual" : 0]
        Aff1.debateTimes = ["OpenAff" : 0, "QOC" : 0, "CloseAff" : 0, "Individual" : 0]
        
        let Aff2 = debater(inName: enteredText[1]!, inStance: "Aff")
        Aff2.debateScores = ["RebAff" : 0, "QOC" : 0, "Individual" : 0]
        Aff2.debateScores = ["RebAff" : 0, "QOC" : 0, "Individual" : 0]
        
        let Neg1 = debater(inName: enteredText[2]!, inStance: "Neg")
        Neg1.debateScores = ["OpenNeg" : 0, "QOC" : 0, "CloseNeg" : 0, "Individual" : 0]
        Neg1.debateScores = ["OpenNeg" : 0, "QOC" : 0, "CloseNeg" : 0, "Individual" : 0]
        
        let Neg2 = debater(inName: enteredText[3]!, inStance: "Neg")
        Neg2.debateScores = ["RebNeg" : 0, "QOC" : 0, "Individual" : 0]
        Neg2.debateScores = ["RebNeg" : 0, "QOC" : 0, "Individual" : 0]
        
        let currentDebate = debate(inName: debateName.text!, Affspeaker1: Aff1, Affspeaker2: Aff2, Negspeaker1: Neg1, Negspeaker2: Neg2)
        
        let defaults = UserDefaults.standard
        defaults.set(debateName.text, forKey: "current")
        
        let savedData = NSKeyedArchiver.archivedData(withRootObject: currentDebate)
        defaults.set(savedData, forKey: debateName.text!)
        */
    }
        
}
