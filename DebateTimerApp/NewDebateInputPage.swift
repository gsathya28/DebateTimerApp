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
    
    @IBOutlet weak var pickerView: UIPickerView!

    @IBOutlet weak var debateName: UITextField!
    
    @IBOutlet weak var speak1Aff: UITextField!
    @IBOutlet weak var speak2Aff: UITextField!
    @IBOutlet weak var speak1Neg: UITextField!
    @IBOutlet weak var speak2Neg: UITextField!
    
   
    var pickerData = ["Hour 1", "Hour 2", "Hour 3", "Hour 4", "Hour 5", "Hour 6", "Hour 7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
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
        
    }
    // Call this method somewhere in your view controller setup code.
    - (void)registerForKeyboardNotifications
    {
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(keyboardWasShown:)
    name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(keyboardWillBeHidden:)
    name:UIKeyboardWillHideNotification object:nil];
    
    }
    
    // Called when the UIKeyboardDidShowNotification is sent.
    - (void)keyboardWasShown:(NSNotification*)aNotification
    {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
    [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
    }
    }
    
    // Called when the UIKeyboardWillHideNotification is sent
    - (void)keyboardWillBeHidden:(NSNotification*)aNotification
    {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    }
    
    - (void)textFieldDidBeginEditing:(UITextField *)textField
    {
    activeField = textField;
    }
    
    - (void)textFieldDidEndEditing:(UITextField *)textField
    {
    activeField = nil;
    }
    
}
