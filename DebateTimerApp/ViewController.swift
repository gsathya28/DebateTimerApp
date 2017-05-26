//
//  ViewController.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var AppTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToTitlePage(_sender: UIStoryboardSegue) {
    }
    
    @IBAction func NewDebate(_ sender: AnyObject) {
    }
    
    @IBAction func ContinueDebate(_ sender: AnyObject) {
        loadDebateArray()
        for debate in debateArray
        {
            if (!(debate.isFinished))
            {
                unfinishedDebates.append(debate)
            }
        }
    }
    
    @IBAction func PreviousDebates(_ sender: AnyObject) {
        loadDebateArray()
        for debate in debateArray
        {
            if (debate.isFinished)
            {
                finishedDebates.append(debate)
            }
        }
    }
    
}

