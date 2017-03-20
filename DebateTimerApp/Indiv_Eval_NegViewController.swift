//
//  Indiv_Eval_NegViewController.swift
//  DebateTimerApp
//
//  Created by FLAUM, JACOB on 3/20/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class Indiv_Eval_NegViewController: UIViewController {

    @IBOutlet weak var scrollV1: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollV1.contentSize.height = 1150

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
