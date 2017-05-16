//
//  DebateData.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 2/13/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class DebateData: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToDebateData(_sender: UIStoryboardSegue) {
    }
    
    @IBAction func makePDF(_ sender: Any) {
        
        var html = "<!DOCTYPE html><html><head><style>table, th, td { border: 1px solid black;}</style><table><tr><th> Round</th><th>Comments</th><th>Score</th><th>Time </th></tr>"
        html = htmlfunc(array: giveRoundArray(type: "Aff"), html: html)
        html = htmlfunc(array: giveRoundArray(type: "Neg"), html: html)
        let fmt = UIMarkupTextPrintFormatter(markupText: html)
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        let printable = page.insetBy(dx: 0, dy: 0)
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
        
        for i in 1...render.numberOfPages {
            
            UIGraphicsBeginPDFPage();
            let bounds = UIGraphicsGetPDFContextBounds()
            render.drawPage(at: i - 1, in: bounds)
        }
        
        UIGraphicsEndPDFContext();
        
        // 5. Save PDF file
        // let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        // let ArchiveURLCurrent = DocumentsDirectory.appendingPathComponent("banana")
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        pdfData.write(toFile: "\(documentsPath)/\(currentDebate?.name).pdf", atomically: true)
    }
    //adds affirmative/negative array debate data to string html
    func htmlfunc (array: [debateRound] , html : String) -> String{
        var html1 = ""
    for round in array {
    html1 = html1 + "<tr></tr><td>round.roundname</td><td>/(round.roundRawTime) b</td><td>insert</td><td>\(round.roundPoints)/\(round.roundPointsPossible)</td>"
    
}
        return html + html1
}

}
