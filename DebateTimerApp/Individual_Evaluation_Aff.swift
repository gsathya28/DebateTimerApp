//
//  Individual_Evaluation_Aff.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 3/23/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class Individual_Evaluation_Aff: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var textfield5: UITextField!
    @IBOutlet weak var textfield6: UITextField!
    @IBOutlet weak var ContinueButton: UIButton!
    
    let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    var currentDebate: debate?
    var roundCounter: Int?
    var round: debateRound?
    var ArchiveURLCurrent: URL?
    
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
    
    @IBAction func IndEvalSave(_ sender: UIButton) {
        
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: "Incorrect score!", message: "A score you entered is not within the possible points limit.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func `continue`(_ sender: Any) {
        
        let text1: Int? = Int(textfield1.text!)
        let text2: Int? = Int(textfield1.text!)
        let text3: Int? = Int(textfield1.text!)
        let text4: Int? = Int(textfield1.text!)
        let text5: Int? = Int(textfield1.text!)
        let text6: Int? = Int(textfield1.text!)

        if(textfield1.text == "" || textfield2.text == "" || textfield3.text == "" || textfield4.text == "" || textfield5.text == "" || textfield6.text == "" || text1! > 5 || text2! > 5 || text3! > 5 || text4! > 5 || text5! > 5 || text6! > 5 || text1! < 0 || text2! < 0 || text3! < 0 || text4! < 0 || text5! < 0 || text6! < 0)
        {
            showAlertButtonTapped(ContinueButton)
        }
    }
    
}
