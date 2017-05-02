//
//  globalVariables.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 4/27/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import Foundation

var currentDebate: debate?
let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
var ArchiveURLCurrent: URL?
let defaults = UserDefaults.standard
// ----------

var roundCounter: Int?
var Speak3AffCount: Int?
var Speak3NegCount: Int?

// ----------

var EvalAffspeaker1: debater?
var EvalAffspeaker2: debater?
var EvalAffspeaker3: debater?

// ----------

var EvalNegspeaker1: debater?
var EvalNegspeaker2: debater?
var EvalNegspeaker3: debater?


func loadCurrentDebate()
{
    let defaults = UserDefaults.standard
    roundCounter = defaults.object(forKey: "roundCounter") as? Int
    print(String(describing: roundCounter))
    let id = defaults.object(forKey: "current") as? String
    ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
    currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
}

func giveRoundArray() -> [debateRound]
{
    return (currentDebate?.rounds)!
}

/*
func configuredMailComposeViewController() -> MFMailComposeViewController {
    let emailController = MFMailComposeViewController()
    emailController.mailComposeDelegate = self
    emailController.setSubject("Round Report for \(name.text!)")
    emailController.setMessageBody("Round Report for \(name.text!) golfing \(holesPlayedData.text!)\(courseData.text!)", isHTML: false)
    emailController.setToRecipients(["brian.johnson@district196.org", "david.loeffler@district196.org"])
    
    // Attaching the .CSV file to the email.
    emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "Round.csv")
    
    return emailController
}

let emailViewController = configuredMailComposeViewController()
*/

