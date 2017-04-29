//
//  DetailTableViewController.swift
//  ReckonING
//
//  Created by Seet on 20/4/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    let USER_PROFILE_SECTION = 0
    let ACCOUNT_BALANCE = 1
    
    var firstLaunch = true
    
    var bankName: String? {
        didSet {
            // Update the view.
            NSLog("detailItem\(bankName)")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = bankName

        // Set background color
        Style.setupTableGradient(view: self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Disable the Alexa Interaction screen upload refresh.
        /*
        if (firstLaunch)
        {
            performSegue(withIdentifier: "AlexaInteractionSegue", sender: self)
            firstLaunch = false
        }
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == USER_PROFILE_SECTION
        {
            return 1
        }
        else
        {
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == USER_PROFILE_SECTION
        {
            return 200
        }
        else
        {
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        if indexPath.section == USER_PROFILE_SECTION
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileCell", for: indexPath)
            cell.backgroundColor = UIColor.clear
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountBalanceCell", for: indexPath)
            cell.backgroundColor = UIColor.clear

            if bankName == "DBS"
            {
                switch indexPath.row
                {
                case 0:
                    cell.textLabel?.text = "Cash"
                    cell.detailTextLabel?.text = "$12,615.50"
                    break
                case 1:
                    cell.textLabel?.text = "Debts"
                    cell.detailTextLabel?.text = "$3,200.00"
                    break
                case 2:
                    cell.textLabel?.text = "Loan"
                    cell.detailTextLabel?.text = "$150,000.00"
                    break
                default:
                    break
                }
            }
            else if bankName == "OCBC"
            {
                switch indexPath.row
                {
                case 0:
                    cell.textLabel?.text = "Cash"
                    cell.detailTextLabel?.text = "$15,000.50"
                    break
                case 1:
                    cell.textLabel?.text = "Debts"
                    cell.detailTextLabel?.text = "$6,400.00"
                    break
                case 2:
                    cell.textLabel?.text = "Loan"
                    cell.detailTextLabel?.text = "$80,000.00"
                    break
                default:
                    break
                }
            }
            else if bankName == "Citibank"
            {
                switch indexPath.row
                {
                case 0:
                    cell.textLabel?.text = "Cash"
                    cell.detailTextLabel?.text = "$500,000.50"
                    break
                case 1:
                    cell.textLabel?.text = "Debts"
                    cell.detailTextLabel?.text = "$10,400.00"
                    break
                case 2:
                    cell.textLabel?.text = "Loan"
                    cell.detailTextLabel?.text = "$9,000.00"
                    break
                default:
                    break
                }
            }
            else
            {
                switch indexPath.row
                {
                case 0:
                    cell.textLabel?.text = "Cash"
                    cell.detailTextLabel?.text = "$0.00"
                    break
                case 1:
                    cell.textLabel?.text = "Debts"
                    cell.detailTextLabel?.text = "$0.00"
                    break
                case 2:
                    cell.textLabel?.text = "Loan"
                    cell.detailTextLabel?.text = "$0.00"
                    break
                default:
                    break
                }
            }
            return cell
        }
    }

    // MARK: - Refresh the tableView when orientation changed
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        //self.tableView.reloadData()
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
