//
//  TimerPageGUI.swift
//  DebateTimerApp
//
//  Created by FLAUM, JACOB on 12/16/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class TimerPageGUI: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    // Properties- Set the variables here
    
    @IBOutlet weak var CommentsBox: UITextView!
    @IBOutlet weak var pickerView1: UIPickerView!
    var pickerData1 = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    var keyboardHeight: Int = 0
    
    @IBOutlet var continueSegue: UIButton!
    
    @IBOutlet var counterlabel: UILabel!
    var timer = Timer()
    // This is to keep track of each digit in the timer
    var centisecond = 0
    var decisecond = 0
    var second = 0
    var tensecond = 0
    var minute = 0
    var rawTime = 0
    // This is different, I’m not exactly sure what this is for, looking back. I’ll look into this.
    var savedcentisecond = 0
    
    // These are the buttons Pause, Play and Reset: HOWEVER: THESE ARE OUTLETS. When you make this code. You’re going to have to drag the button twice. Once to make it into an outlet, another time to make it into a method (down below).
    
    @IBOutlet var pause: UIButton!
    @IBOutlet var start: UIButton!
    @IBOutlet var reset: UIButton!
    @IBOutlet var save: UIButton!
    
    
    @IBOutlet weak var AffirmativeLabel: UILabel!
    
    var currentDebate: debate?
    var roundCounter: Int?
    var round: debateRound?
    @IBOutlet weak var rubricText: UILabel!
    
    // Load Stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: "current") as? String
        
        roundCounter = defaults.object(forKey: "roundCounter") as? Int
        
        if let savedData = defaults.object(forKey: id!) as? Data
        {
            currentDebate = NSKeyedUnarchiver.unarchiveObject(with: savedData) as! debate?
        }

        round = currentDebate?.rounds[roundCounter!]
        let roundName = currentDebate?.rounds[roundCounter!].roundName
        AffirmativeLabel.text = roundName!

        if (roundCounter! < 2)
        {
            rubricText.text = "Grading Rubric \n\nAre the arguments well supported with logical reasoning or evidence? \n\nDoes the case open and close effectively? Was each argument clearly stated? \n\nWere there 2-3 clearly defined contention statements? (2 points) \n\nWere there 3 supporting pieces of evidence for each contention? (3 pts) \n HI!"
            
            
            if (roundCounter! == 1)
            {
                pause.backgroundColor = UIColor.red
                start.backgroundColor = UIColor.red
                reset.backgroundColor = UIColor.red
                save.backgroundColor = UIColor.red
                
            }
            
        }
        else if (roundCounter == 2)
        {
            // Segue To QOC - should not come here
        }
        else
        {
            if (roundCounter! == 3 || roundCounter! == 4)
            {
                rubricText.text = "Gradic Rubric \n\nDoes the case refute the opposing case? \n\nDoes the case have supporting data and arguments?"
            }
            if (roundCounter! == 5 || roundCounter! == 6)
            {
                rubricText.text = "Gradic Ruburic \n\nDoes the team defend the most important point in their own case and attack the most important point in their opponent's case?"
            }
        }
        
        
        
        
        
        /*
        //create rectangle
        let frame1 = CGRect(x: 567, y: 570, width: 447, height: 128)
        let dataBorder = UIView(frame: frame1) //Largest Border
        dataBorder.backgroundColor = UIColor.clear
        dataBorder.layer.borderWidth = 1.0
        view.addSubview(dataBorder)
        dataBorder.addSubview(CommentsBox)
        */
        CommentsBox!.delegate = self
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
        
    }
    
    
    // This is the method that will run when the play button is activated. This is what I meant when you have to drag the button into the code as a button. I’ll go through each line one by one.
    
    @IBAction func startTimer(_ sender: UIButton) {
        centisecond = savedcentisecond
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(TimerPageGUI.action), userInfo: nil, repeats: true)
        start.isEnabled = false
        pause.isEnabled = true
        reset.isEnabled = false
        continueSegue.isEnabled = false
    }
    
    // This is the method that will run when the pause button is pressed
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        timer.invalidate()
        savedcentisecond = centisecond
        centisecond = 0;
        start.isEnabled = true
        reset.isEnabled = true
        pause.isEnabled = false
        continueSegue.isEnabled = true
    }
    
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        centisecond = 0
        decisecond = 0
        second = 0
        tensecond = 0
        minute = 0
        counterlabel.text = ("00:00:00")
        start.isEnabled = true
        pause.isEnabled = true
    }
    
    @IBAction func saveTime(_ sender: UIButton) {
        
    }
    
    
    func action()
    {
        centisecond += 1
        rawTime += 1
        
        if (centisecond == 10)
        {
            centisecond = 0
            decisecond += 1
        }
        
        if (decisecond == 10)
        {
            decisecond = 0
            second += 1
        }
        
        if (second == 10)
        {
            second = 0
            tensecond += 1
        }
        
        if (tensecond == 6)
        {
            tensecond = 0
            minute += 1
        }
        
        counterlabel.text = String(minute) + ":" + String(tensecond) + String(second) +  ":" + String(decisecond) + String(centisecond)
        
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
