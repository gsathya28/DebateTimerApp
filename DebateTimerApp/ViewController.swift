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
    
    @IBOutlet var webView: UIWebView!
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
    }
    
    @IBAction func PreviousDebates(_ sender: AnyObject) {
    }
    
    @IBAction func loadPDF(_ sender: Any) {
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
        
        pdfData.write(toFile: "\(documentsPath)/file.pdf", atomically: true)

    }
    
    @IBAction func viewPDF(_ sender: Any) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = "\(documentsPath)/file.pdf"
        let url = NSURL(fileURLWithPath: filePath)
        let urlRequest = NSURLRequest(url: url as URL)
        webView.loadRequest(urlRequest as URLRequest)
    }
    
    
    @IBAction func exportFile(_ sender: Any) {
        /*
        let matchExport: [String] = [",First Name,Last Name,Date,Location,Weather,Score,Putts,Fairways,Penalties,UpDownAtt,UpDownComp,ScoringClub,Rank\r\n",passedRound.firstName.description,passedRound.lastName.description,passedRound.date.description,passedRound.location.description,weatherData.text!,scoreData.text!,puttData.text!,fairwayData.text!,penaltyData.text!,upDownAttData.text!,upDownCompData.text!,scoringClubData.text!,finishData.text!]
        
        let inputString = matchExport.joined(separator: ",")
        
        let data = inputString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let content = data {
            print("NSData: \(content)")
        }
        */
        
        // Generating the email controller.
        func configuredMailComposeViewController() -> MFMailComposeViewController {
            
            let emailController = MFMailComposeViewController()
            emailController.mailComposeDelegate = self
            emailController.setSubject("TestEmail")
            emailController.setMessageBody("Banana", isHTML: false)
            emailController.setToRecipients(["gsathya28@gmail.com"])
            
            // Attaching the .CSV file to the email.
            /*emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "Round.csv")*/
            
            return emailController
        }
        
        func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            // Check the result or perform other tasks.
            Swift.print("Wheeee!")
            // Dismiss the mail compose view controller.
            controller.dismiss(animated: true, completion: nil)
        }
        
        // If the view controller can send the email.
        // This will show an email-style popup that allows you to enter
        // Who to send the email to, the subject, the cc's and the message.
        // As the .CSV is already attached, you can simply add an email
        // and press send.
        let emailViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(emailViewController, animated: true, completion: nil)
            Swift.print(MFMailComposeViewController.canSendMail())
            Swift.print("Hello!")
        }
        
    }
    
}

