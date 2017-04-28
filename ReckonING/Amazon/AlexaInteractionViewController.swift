//
//  AlexaInteractionViewController.swift
//  ReckonING
//
//  Created by Seet on 28/4/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class AlexaInteractionViewController: UITableViewController {

    let TITLE_SECTION = 0
    let INTERACTION_SECTION = 1
    let DISMISS_SECTION = 2

    var timer: Timer!
    var numMessages = 1
    var shouldDismiss = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        // Set the Master background color
        Style.setupTableGradient(view: self.view)

        // Timer to refresh
        self.timer = Timer(timeInterval: 3.0, target: self, selector: #selector(AlexaInteractionViewController.fireCellsUpdate), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: RunLoopMode.commonModes)
    }

    deinit {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UI Updates
    
    func fireCellsUpdate() {
        let notification = NSNotification(name: NSNotification.Name(rawValue: "CustomCellUpdate"), object: nil)
        NotificationCenter.default.post(notification as Notification)
        
        if (numMessages < 3)
        {
            numMessages += 1
        }
        else
        {
            shouldDismiss = true
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section)
        {
        case TITLE_SECTION:
            return 1
        case INTERACTION_SECTION:
            return numMessages
        case DISMISS_SECTION:
            return shouldDismiss ? 1 : 0
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        if (indexPath.section == TITLE_SECTION)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath)
            cell.textLabel?.text = ""
            return cell
        }
        else if (indexPath.section == INTERACTION_SECTION)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath)
            switch (indexPath.row)
            {
            case 0:
                cell.textLabel?.text = "Welcome Ada"
                break;
            case 1:
                cell.textLabel?.text = "Pay $20 to Sam from my Citibank account."
                break;
            case 2:
                cell.textLabel?.text = "Your Citibank account balance is $6880."
                break;
            default:
                break;
            }
            return cell
        }
        else
        {
            // DISMISS_SECTION
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationDismissCell", for: indexPath)
            cell.textLabel?.text = "Dismiss"
            return cell
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == DISMISS_SECTION)
        {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
