//
//  PayeeTableViewController.swift
//  ReckonING
//
//  Created by Seet on 13/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class PayeeTableViewController: UITableViewController {

    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the Master background color
        Style.setupTableGradient(view: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayeeCell", for: indexPath)
        cell.backgroundColor = UIColor.clear

        if indexPath.section == 0
        {
            switch indexPath.row
            {
            case 0:
                cell.textLabel?.text = "Nadia"
                cell.detailTextLabel?.text = "Nadia Ciesielska, BankId:ing, Account: 02637598-4a80-6431-965a-0d5873ba461e"
                break;
            case 1:
                cell.textLabel?.text = "Tad"
                cell.detailTextLabel?.text = ""
                cell.detailTextLabel?.text = "Tadeusz Piotrowski, BankId:ing, Account: 03209146-cdf2-8147-b301-45f7e06182ba"
                break;
            default:
                break;
            }
        }

        return cell
    }
}
