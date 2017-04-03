//
//  TableView-sortOf.swift
//  DebateTimerApp
//
//  Created by FLAUM, JACOB on 3/16/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class TableView_sortOf: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableV1: UITableView!
    
    var documentList: [String] = ["lets" , "see" , "if" , "this" , "works"]
    
    let cellReuseIdendifier = "FileCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV1.register(FileCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableV1.dataSource = self
        tableV1.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
       
        // Do any additional setup after loading the view.

        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentList.count
            //documentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath as IndexPath) as! FileCell
        
        //documentList = getFileList()
        //for x in 0...documentList.count
        cell.labels["file"]?.Label.text = documentList[indexPath.row]
            //documentList[indexPath.row]\
        
        return cell
            
    }
}

