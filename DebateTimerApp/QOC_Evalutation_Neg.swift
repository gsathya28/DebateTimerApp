//
//  QOC_Evalutation_Neg.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 2/1/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class QOC_Evalutation_Neg: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var PickerView: UIPickerView!

    var pickerData1 = ["0","1","2","3","4","5"]
    
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData1[row]
    }

}
