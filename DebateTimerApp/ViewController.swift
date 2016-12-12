//
//  ViewController.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 12/5/16.
//  Copyright © 2016 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet var AppTitle: UILabel!
    
    @IBOutlet weak var PickerView: UIPickerView!

    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NewDebate(_ sender: AnyObject) {
    }
    
    @IBAction func ContinueDebate(_ sender: AnyObject) {
    }
    
    @IBAction func PreviousDebates(_ sender: AnyObject) {
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.view.backgroundColor = UIColor.white
        }
        else if(row == 1)
        {
            self.view.backgroundColor = UIColor.red
        }
        else if(row == 2)
        {
            self.view.backgroundColor =  UIColor.green
        }
        else
        {
            self.view.backgroundColor = UIColor.blue
        }
    }

}

