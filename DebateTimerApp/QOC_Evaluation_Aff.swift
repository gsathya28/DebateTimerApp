//
//  QOC_Evaluation_Aff.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 2/1/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class QOC_Evaluation_Aff: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var PickerView: UIPickerView!
    var pickerData1 = ["0","1","2","3","4","5"]
    
    
    @IBOutlet weak var rubricText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.delegate = self
        PickerView.dataSource = self
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "current") as? String
        ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
        
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        
        currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
        
        QOCround = currentDebate?.rounds[roundCounter!]
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
    
    @IBAction func unwindToQOCEvaluationAff(_sender: UIStoryboardSegue) {
    
    }
    
    @IBAction func EvalSave(_ sender: UIButton) {
        let myRow = PickerView.selectedRow(inComponent: 0)
        let score = pickerView(PickerView, titleForRow: myRow, forComponent: 0)
        let intScore = Int(score!)
        QOCround?.roundAffPoints = intScore
        
        if (!((QOCround!.roundNegPoints != nil)))
        {
            print("Alert goes here")
        }
        
        currentDebate?.rounds[2] = QOCround!
        let savedData = NSKeyedArchiver.archiveRootObject(currentDebate!, toFile: (ArchiveURLCurrent?.path)!)
    }
    
    
    
}
