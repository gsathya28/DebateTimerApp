//
//  Indiv_Eval_NegViewController.swift
//  DebateTimerApp
//
//  Created by FLAUM, JACOB on 3/20/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class Indiv_Eval_NegViewController: UIViewController {

    @IBOutlet weak var scrollV1: UIScrollView!
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var textfield5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.keyboardType = UIKeyboardType.numberPad
        textfield1.keyboardType = UIKeyboardType.numberPad
        textfield2.keyboardType = UIKeyboardType.numberPad
        textfield3.keyboardType = UIKeyboardType.numberPad
        textfield4.keyboardType = UIKeyboardType.numberPad
        textfield5.keyboardType = UIKeyboardType.numberPad
        
        scrollV1.contentSize.height = 1150

        // Do any additional setup after loading the view.
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

}
