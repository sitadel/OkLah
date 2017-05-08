//
//  PromoTableViewController.swift
//  ReckonING
//
//  Created by Ivan Jester Cleofe on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class PromoTableViewController: UITableViewController {
    
    let MORTGAGE_ACCOUNT = 0
    let SAVINGS_ACCOUNT = 1
    let CREDIT_CARD = 2
    
    @IBOutlet weak var backButton : UIBarButtonItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.title = "Offers"
        
        // Set background color
        Style.setupTableGradient(view: self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == MORTGAGE_ACCOUNT
        {
            return 1
        }
        
        if section == SAVINGS_ACCOUNT
        {
            return 1
        }
        
        if section == CREDIT_CARD
        {
            return 1
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PromoToDetailsSeque"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                print(indexPath)
                let selectedRow = indexPath[0]
                var promoSite = ""
                switch selectedRow {
                case 0:
                    promoSite = "http://www.google.com"
                case 1:
                    promoSite = "http://www.yahoo.com"
                case 2:
                    promoSite = "http://www.gmail.com"
                default:
                    promoSite = ""
                }
                
                let navViewController = segue.destination as! UINavigationController
                let promoViewController = navViewController.topViewController as! DetailedPromoViewController
                promoViewController.promoSite = promoSite
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromoCell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        
        if indexPath.section == MORTGAGE_ACCOUNT
        {
            cell.textLabel?.text = "Mortgage"
        }
        
        if indexPath.section == SAVINGS_ACCOUNT
        {
            cell.textLabel?.text = "Savings"
        }
        
        if indexPath.section == CREDIT_CARD
        {
            cell.textLabel?.text = "Credit Card"
        }
        
            return cell
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

