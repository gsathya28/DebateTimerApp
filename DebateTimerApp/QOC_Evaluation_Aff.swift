//
//  QOC_Evaluation_Aff.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 2/1/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class QOC_Evaluation_Aff: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

// MARK: Outlets
    @IBOutlet weak var PickerView: UIPickerView!

    
// MARK: ViewLoader
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.delegate = self
        PickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
// MARK: PickerView Data and Functions
    var pickerData1 = ["0","1","2","3","4","5"]
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

// MARK: Round Counter Mechanism
    @IBAction func continueMenu(_ sender: UIButton) {

    }
 
    

}
