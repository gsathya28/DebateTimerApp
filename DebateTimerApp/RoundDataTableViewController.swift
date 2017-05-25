//
//  RoundDataTableViewController.swift
//  DebateTimerApp
//
//  Created by GOVINDARAJAN, SATHYANARAYANAN on 4/24/17.
//  Copyright © 2017 GOVINDARAJAN, SATHYANARAYANAN. All rights reserved.
//

import UIKit

class RoundDataTableViewController: UITableViewController {
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    
    var affRoundArray: [debateRound]?
    var negRoundArray: [debateRound]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadCurrentDebate()
        affRoundArray = giveRoundArray(type: "Aff")
        negRoundArray = giveRoundArray(type: "Neg")
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections (columns)
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (affRoundArray?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath) as! FileCell

        if ((indexPath.section == 0))
        {
            let tableRound = affRoundArray?[indexPath.row]
            if (tableRound?.roundRawTime != -1 || tableRound?.roundAffTime != -1 || tableRound?.roundNegTime != -1)
            {
                cell.roundNameText.text = tableRound?.roundName
                // Configure the cell...
                cell.roundScoreText.text = "\((tableRound?.roundPoints)!) / \((tableRound?.roundPointsPossible)!)"
                let tableRawTime = (tableRound?.roundRawTime)!
                    
                cell.roundTimeText.text = convertRawTime(rawTime: tableRawTime)
                return cell
            }
            else
            {
                cell.roundNameText.text = tableRound?.roundName
                cell.roundTimeText.text = "N/A"
                cell.roundScoreText.text = "N/A"
                return cell
            }
        }
        else if (indexPath.section == 1)
        {
            let tableRound = negRoundArray?[indexPath.row]
            if (tableRound?.roundRawTime != -1 || tableRound?.roundAffTime != -1 || tableRound?.roundNegTime != -1)
            {
                cell.roundNameText.text = tableRound?.roundName
                // Configure the cell...
                cell.roundScoreText.text = "\((tableRound?.roundPoints)!) / \((tableRound?.roundPointsPossible)!)"
                let tableRawTime = (tableRound?.roundRawTime)!
                
                cell.roundTimeText.text = convertRawTime(rawTime: tableRawTime)
                return cell
            }
            else
            {
                cell.roundNameText.text = tableRound?.roundName
                cell.roundTimeText.text = "N/A"
                cell.roundScoreText.text = "N/A"
                return cell
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0)
        {
            return "Affirmative"
        }
        else if (section == 1)
        {
            return "Negative"
        }
        else if (section == 2)
        {
            return "Individual Scores"
        }
        
        return "----"
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}