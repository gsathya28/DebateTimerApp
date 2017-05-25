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
    
    @IBAction func createPDF(_ sender: Any) {
        
        /*
        var html = "<table><tr><th> Round</th><th>Comments</th><th>Score</th><th>Time</th></tr>"
        var array = giveRoundArray(type: "Aff")
        html = htmlfunc(array: array , html: html)
        array = giveRoundArray(type: "Neg")
        html = html + "</table>"
        
        
        let fmt = UIMarkupTextPrintFormatter(markupText: html)
        
        // 2. Assign print formatter to UIPrintPageRenderer
        
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        
        // 3. Assign paperRect and printableRect
        
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        let printable = page.insetBy(dx: 0, dy: 0)
        
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        
        // 4. Create PDF context and draw
        
        pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData as! NSMutableData, CGRect.zero, nil)
        
        for i in 1...render.numberOfPages {
            
            UIGraphicsBeginPDFPage();
            let bounds = UIGraphicsGetPDFContextBounds()
            render.drawPage(at: i - 1, in: bounds)
        }
        
        UIGraphicsEndPDFContext();
        
        // 5. Save PDF file
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        pdfData?.write(toFile: "\(documentsPath)/file.pdf", atomically: true) */
    }
    
}
