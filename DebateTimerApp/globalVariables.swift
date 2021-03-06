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
var pdfData: NSData?

// -----------

var debateArray: [debate] = []
var finishedDebates: [debate] = []
var unfinishedDebates: [debate] = []
// The path: let ArchiveURLDebateCurrent = DocumentsDirectory.appendingPathComponent("debateArray")


func saveDebateArray() -> Bool
{
    let ArchiveURLDebateCurrent = DocumentsDirectory.appendingPathComponent("debateArray")
    let savedArray = NSKeyedArchiver.archiveRootObject(debateArray, toFile: ArchiveURLDebateCurrent.path)
    return savedArray
}
func loadDebateArray() -> [debate]
{
    let ArchiveURLDebateCurrent = DocumentsDirectory.appendingPathComponent("debateArray")
    let debateArr = NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURLDebateCurrent.path) as! [debate]
    return debateArr
}

func loadCurrentDebate()
{
    let defaults = UserDefaults.standard
    roundCounter = defaults.object(forKey: "roundCounter") as? Int
    print(String(describing: roundCounter))
    let id = defaults.object(forKey: "current") as? String
    ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent(id!)
    currentDebate = NSKeyedUnarchiver.unarchiveObject(withFile: (ArchiveURLCurrent?.path)!) as! debate?
}

func giveRoundArray(type: String) -> [debateRound]
{
    var roundArray = [debateRound]()
    for round in (currentDebate?.rounds)!
    {
        if (round.roundType == type || round.roundType == "Quest")
        {
            roundArray.append(round)
        }
    }
    
    return roundArray
}

func convertRawTime(rawTime: Int) -> String
{
    let minutes = rawTime / 6000
    var remainder = rawTime % 6000
    let tenseconds = remainder / 1000
    remainder = remainder % 1000
    let seconds = remainder / 100
    remainder = remainder % 100
    let deciseconds = remainder / 10
    let centiseconds = remainder % 10
    let finalString = "\(minutes):\(tenseconds)\(seconds):\(deciseconds)\(centiseconds)"
    return finalString
}

func htmlfunc (array: [debateRound] , html : String) -> String{
    var html1 = ""
    for round in array {
        var rawTime: String = ""
        var rawPoints: String = ""
        
        if (round.roundRawTime == -1)
        {
            rawTime = "N/A"
        }
        else
        {
            rawTime = convertRawTime(rawTime: round.roundRawTime!)
        }
        if (round.roundPoints == -1)
        {
            rawPoints = "N/A"
        }
        else{
            rawPoints = "\(round.roundPoints!)/\(round.roundPointsPossible!)"
        }
        
        html1 = html1 + "<tr></tr><td>\(round.roundName!)</td><td>\(rawTime)</td><td>insert Comments</td><td>\(rawPoints)</td>"
        
    }
    return html + html1
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

