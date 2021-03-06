//
//  QOC_Evalutation_Neg.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 2/1/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

var QOCround: debateRound?

class QOC_Evalutation_Neg: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Picker Data Variables
    @IBOutlet weak var PickerView: UIPickerView!
    var pickerData1 = ["0","1","2","3","4","5"]
    var keyboardHeight: Int = 0
    // Debate Data Variables
    
    // UI Label Properties
    @IBOutlet weak var rubricText: UILabel!
    @IBOutlet weak var commentsBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Picker View Data Setup
        PickerView.delegate = self
        PickerView.dataSource = self
        
        // Load Data Variables
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "current") as? String
        ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
        
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        
        currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
        
        QOCround = currentDebate?.rounds[roundCounter!]
        
        commentsBox!.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(TimerPageGUI.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification)
    {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        self.keyboardHeight = Int(keyboardRectangle.height)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -(CGFloat(keyboardHeight)))
        textView.text = ""
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: CGFloat(keyboardHeight))
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData1[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData1[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.white])
        return myTitle
    }
    @IBAction func EvalSave(_ sender: UIButton) {
        let myRow = PickerView.selectedRow(inComponent: 0)
        let score = pickerView(PickerView, titleForRow: myRow, forComponent: 0)
        let intScore = Int(score!)
        QOCround?.roundNegPoints = intScore
        
        if (!((QOCround!.roundAffPoints != nil)))
        {
            print("Alert goes here")
        }

        currentDebate?.rounds[2] = QOCround!
        let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: (ArchiveURLCurrent?.path)!)
    }
}
