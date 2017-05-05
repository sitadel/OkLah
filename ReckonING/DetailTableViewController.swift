//
//  DetailTableViewController.swift
//  ReckonING
//
//  Created by Seet on 20/4/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit
import Intents

class DetailTableViewController: UITableViewController {

    let NUMBER_OF_SECTION = 3
    let USER_PROFILE_SECTION = 0
    let USER_ACCOUNT_SUMMARY_SECTION = 1
    let USER_TRANSACTION_SECTION = 2
    //let ACCOUNT_BALANCE = 1
    
    let AC_ASSET = "Available Balance"
    let AC_LIABILITY = "Liability"
    
    var firstLaunch = true
    
    var account: Account? {
        didSet {
        }
    }
    
    var bankName: String? {
        didSet {
            // Update the view.
            //NSLog("detailItem\(bankName)")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check Siri authorization status
        if #available(iOS 10.0, *) {
            switch INPreferences.siriAuthorizationStatus()
            {
            case .authorized:
                print("Siri Authorized")
                break
            case .denied:
                print("Siri Denied")
                break;
            default:
                print("Siri Other status")
            }
        }
        
        // Ask permission to access Siri
        if #available(iOS 10.0, *) {
            INPreferences.requestSiriAuthorization { authorizationStatus in
                switch authorizationStatus {
                case .authorized:
                    print("Authorized")
                default:
                    print("Not Authorized")
                }
            }
        } else {
            // Display message that Siri is not supported
            let alert = UIAlertController(title: "Siri ReckonING not available", message: "Siri ReckonING requires iOS 10 and above.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        // set the title bar
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
        return NUMBER_OF_SECTION
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == USER_PROFILE_SECTION || section == USER_TRANSACTION_SECTION
        {
            return 1
        }
        else
        {
            //section == USER_ACCOUNT_SUMMARY_SECTION
            return 2
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
        else if indexPath.section == USER_ACCOUNT_SUMMARY_SECTION
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountBalanceCell", for: indexPath)
            cell.backgroundColor = UIColor.clear

            if bankName == "DBS"
            {
                switch indexPath.row
                {
                case 0:
                    cell.textLabel?.text = AC_ASSET
                    cell.detailTextLabel?.text = "$12,615.50"
                    break
                case 1:
                    cell.textLabel?.text = AC_LIABILITY
                    cell.detailTextLabel?.text = "$150,000.00"
                    break
                case 2:
                    cell.textLabel?.text = "Loan"
                    cell.detailTextLabel?.text = "$8,800.00"
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
                    cell.textLabel?.text = AC_ASSET
                    cell.detailTextLabel?.text = "$15,000.50"
                    break
                case 1:
                    cell.textLabel?.text = AC_LIABILITY
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
                    cell.textLabel?.text = AC_ASSET
                    cell.detailTextLabel?.text = "$500,000.50"
                    break
                case 1:
                    cell.textLabel?.text = AC_LIABILITY
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
                    cell.textLabel?.text = AC_ASSET
                    if let currency = account?.currency,
                        let amount = account?.cashAmount
                    {
                        cell.detailTextLabel?.text = "\(currency) \(amount)"
                    }
                    break
                case 1:
                    cell.textLabel?.text = AC_LIABILITY
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
        else
        {
            // USER_TRANSACTION_SECTION
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewTransactionsCell", for: indexPath)
            cell.backgroundColor = UIColor.clear

            cell.textLabel?.text = "View Transactions"
            return cell;
        }
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
