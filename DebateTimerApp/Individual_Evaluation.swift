//
//  Individual_Evaluation.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 2/3/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class Individual_Evaluation: UIViewController, UITextViewDelegate {
    
// MARK: Outs
    @IBOutlet weak var CommentsBoxNeg: UITextView!
    @IBOutlet weak var CommentsBoxAff: UITextView!
    @IBOutlet weak var Stu1CommentAff: UITextView!
    @IBOutlet weak var Stu1CommentNeg: UITextView!
    
    
// MARK: ViewLoader
    override func viewDidLoad() {
        super.viewDidLoad()
        CommentsBoxNeg!.delegate = self
        CommentsBoxAff!.delegate = self
        Stu1CommentAff!.delegate = self
        Stu1CommentNeg.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(Individual_Evaluation.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: Keyboard Stuff
    var keyboardHeight: Int = 0
    
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
    
// MARK: Round Counting Mechanism
    @IBAction func continueMenu(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        var roundCounter = defaults.object(forKey: "roundCounter") as? Int
        roundCounter = roundCounter! + 1
        defaults.set(roundCounter, forKey: "roundCounter")
    }
}
