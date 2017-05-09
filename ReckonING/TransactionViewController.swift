//
//  TransactionViewController.swift
//  ReckonING
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class TransactionViewController: UITableViewController {

    let MAX_TRANSACTION = 5
    var transactions = [Transaction]()

    var account: Account? {
        didSet {
        }
    }

    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Set background color
        Style.setupTableGradient(view: self.view)
        
        // load data
        loadTransaction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Load data
    
//    user_name=iamsam&bank_id=at02-0182--01&account=iamsam_spain

    func loadTransaction()
    {
        //let url = Server.getTransactions(username: "iamsam", bankId: "at02-0182--01", account: "iamsam_spain")
        if  let username = account?.displayName,
            let bankId = account?.bankId,
            let acc = account?.id,
            let url = Server.getTransactions(username: username, bankId: bankId, account: acc)
        {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    // Display error message
                    let alert = UIAlertController(title: "Wrong Data Format", message: "\(error?.localizedDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    do {
                        if let data = data,
                            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                            let trans = json["transactionList"] as? [[String: Any]]
                        {
                            // store in cache
                            //Cache.sharedInstance.setAccounts(object: accounts)
                            
                            if trans.count == 0 {
                                let alert = UIAlertController(title: "No Transaction", message: "No transaction in this account.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                            else
                            {
                                self.setupTransaction(transactions: trans)
                            }
                        }
                    } catch {
                        // Display error message
                        let alert = UIAlertController(title: "Wrong Data Format", message: "\(error)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            task.resume()
        }
    }

    func setupTransaction(transactions: [[String:Any]])
    {
        // clear
        self.transactions.removeAll()
        
        // parse each account
        for t in transactions {
            if let trans = Transaction(attributes: t)
            {
                self.transactions.append(trans)
                if self.transactions.count >= MAX_TRANSACTION
                {
                    break;
                }
            }
        }
        
        // refresh
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionTableViewCell
        {

        // Configure the cell...
        cell.backgroundColor = .clear
        
        let trans = self.transactions[indexPath.row]
        cell.balanceLabel.text = "\(trans.balanceCcy) \(trans.newBalance)"
        cell.dateLabel.text = "\(trans.getTransactionTime())"
        cell.transactionLabel.text = "\(trans.description) transfers \(trans.amount) to \(trans.toAccount)"

        return cell
        }
        else
        {
            return tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath);
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66;
    }
}
