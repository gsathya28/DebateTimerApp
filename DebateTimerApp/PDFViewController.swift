//
//  PDFViewController.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 5/17/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit
import MessageUI

class PDFViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var html = "<h3>Affirmative</h3><br>"
        html = html + "<table><tr><th> Round</th><th>Score</th><th>Comments</th><th>Time</th></tr>"
        let Affarray = giveRoundArray(type: "Aff")
        html = htmlfunc(array: Affarray , html: html)
        html = html + "</table>"
        
        html = html + "<h3>Negative</h3><br><table><tr><th> Round</th><th>Score</th><th>Comments</th><th>Time</th></tr>"
        let Negarray = giveRoundArray(type: "Neg")
        html = htmlfunc(array: Negarray, html: html)
        html = html + "</table>"
        
        html = html + "<h3>Individual Scores</h3><br><table><tr><th>Name</th><th>Round Scores</th><th>Delivery Score</th><th>Classtime Score</th><th>Total Scores</th></tr>"
        
        for debater in (currentDebate?.affSpeakers)!
        {
            var roundTotal = 0
            var roundPointsPossible = 0
            var deliveryScore = "N/A"
            var classtimeScore = "N/A"
            for round in Affarray
            {
                roundPointsPossible = roundPointsPossible + round.roundPointsPossible!
                if (round.roundType != "QOC")
                {
                    roundTotal = roundTotal + round.roundAffPoints!
                }
                else
                {
                    roundTotal = roundTotal + round.roundPoints!
                }
            }
            if ((debater.name == nil))
            {
                debater.name = "N/A"
            }
            if (debater.deliveryScore != nil)
            {
                deliveryScore = "\(debater.deliveryScore)"
            }
            if (debater.classtimeScore != nil)
            {
                classtimeScore = "\(debater.classtimeScore)"
            }
            
            
            html = html + "<tr><td>\(debater.name!)</td>"
            html = html + "<td>\(roundTotal)/\(roundPointsPossible)  +  </td>"
            html = html + "<td>\(deliveryScore)/5</td>"
            html = html + "<td>\(classtimeScore)/5</td><td>\(roundTotal + /*debater.deliveryScore!*/ 0 + /*debater.classtimeScore!*/ 0)/\(roundPointsPossible + 10)</td></tr>"
        }
        
        
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
        
        pdfData?.write(toFile: "\(documentsPath)/file.pdf", atomically: true)
        
        
        let filePath = "\(documentsPath)/file.pdf"
        let url = NSURL(fileURLWithPath: filePath)
        let urlRequest = NSURLRequest(url: url as URL)
        webView.loadRequest(urlRequest as URLRequest)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //goes to the email screen when the send button is tapped
   
    @IBAction func SendEmail(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        //makes sure it can send the email
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["mitchell.snobeck@district196.org"])
        mailComposerVC.setSubject("Debates")
        mailComposerVC.setMessageBody("PDF summary of debate...", isHTML: false)
        
        let html = "<b>Hello <i>World!</i></b> <p>Generate PDF file from HTML in Swift</p>"
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
        
        pdfData?.write(toFile: "\(documentsPath)/file.pdf", atomically: true)

        
        mailComposerVC.addAttachmentData(pdfData! as Data, mimeType: "application/pdf", fileName: "debate.pdf" )
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
