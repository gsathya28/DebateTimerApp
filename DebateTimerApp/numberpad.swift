//
//  numberpad.swift
//  DebateTimerApp
//
//  Created by GOFFMAN, BENJAMIN on 3/20/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class numberpad: UIViewController {

    let alert = UIAlertController(title: "AlertController Tutorial",
                                  message: "Submit something",
                                  preferredStyle: .alert)
    
    //submit button
    let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
        // Get 1st TextField's text
        let textField = alert.textFields![0]
        print(textField.text!)
    })
    
    // Cancel button
    let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
