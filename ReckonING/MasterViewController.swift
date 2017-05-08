//
//  MasterViewController.swift
//  ReckonING
//
//  Created by Seet on 20/4/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var accounts = [Account]()
    var objects = [Any]()
    var details = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize data
        initData()
        
        // Do any additional setup after loading the view, typically from a nib.
        /*
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
         */
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        // Set the Master background color
        Style.setupTableGradient(view: self.view)
        
        // Set the refresh control
        self.refreshControl?.addTarget(self, action:#selector(self.handleRefresh), for: UIControlEvents.valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        
        // Setup account from cache or server
        if let accounts = Cache.sharedInstance.getAccounts()
        {
            setupAccounts(accounts: accounts)
        }
        else
        {
            loadAccountSummary()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - handle refresh
    func handleRefresh(refreshControl: UIRefreshControl)
    {
        Cache.sharedInstance.clearAccounts()
        loadAccountSummary()
    }
    
    // MARK: - load account summary
    
    func loadAccountSummary()
    {
        if let url = Server.getAccounts(username: "iamsam") {
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
                            let accounts = json["accountList"] as? [[String: Any]]
                        {
                            // store in cache
                            Cache.sharedInstance.setAccounts(object: accounts)
                            
                            self.setupAccounts(accounts: accounts)
                        }
                    } catch {
                        // Display error message
                        let alert = UIAlertController(title: "Wrong Data Format", message: "\(error)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
                // End refreshing
                if (self.refreshControl?.isRefreshing)!
                {
                    self.refreshControl?.endRefreshing()
                }
            }
            task.resume()
        }
    }
    
    func setupAccounts(accounts: [[String:Any]])
    {
        // clear
        self.accounts.removeAll()
        self.objects.removeAll()
        self.details.removeAll()
        
        // parse each account
        for account in accounts {
            if let ac = Account(attributes: account)
            {
                self.accounts.append(ac)
            }
            
            if  let name = account["bank_fullname"] as? String,
                let amount = account["amount"] as? String,
                let currency = account["currency"] as? String
            {
                self.objects.append(name)
                self.details.append("\(currency) \(amount)")
            }
        }
        
        // refresh
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            
            // select the first bank as default bank
            self.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
            self.performSegue(withIdentifier: "showDetail", sender: self)
        })
    }
    
    // MARK: - initialize data
    
    func initData()
    {
        objects.append("DBS")
        objects.append("OCBC")
        objects.append("Citibank")
        
        details.append("-$140584.5")
        details.append("-$71399.5")
        details.append("$480600.5")
    }
    
    func insertNewObject(_ sender: Any) {
        objects.insert("New Bank", at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! String
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailTableViewController
                
                if indexPath.row < accounts.count
                {
                    controller.account = accounts[indexPath.row]
                }
                
                controller.bankName = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Set cell background color
        if cell.isSelected
        {
            cell.backgroundColor =  Style.masterViewCellSelectedBackground
            cell.textLabel?.textColor = Style.masterViewSelectedTextColor
        }
        else
        {
            setAlternativeBackground(cell: cell, indexPath: indexPath)
            cell.textLabel?.textColor = Style.masterViewTextColor
        }
        
        // Fill in cell details
        if let object = objects[indexPath.row] as? String
        {
            cell.textLabel?.text = object.description
        }
        if let object = details[indexPath.row] as? String
        {
            cell.detailTextLabel?.text = object.description
        }
        
        return cell
    }
    
    func setCellBackground(cell: UITableViewCell, indexPath: IndexPath)
    {
        // Set cell background color
        if cell.isSelected
        {
            cell.backgroundColor =  Style.masterViewCellSelectedBackground
            cell.textLabel?.textColor = Style.masterViewSelectedTextColor
        }
        else
        {
            setAlternativeBackground(cell: cell, indexPath: indexPath)
            cell.textLabel?.textColor = Style.masterViewTextColor
        }
    }
    
    func setAlternativeBackground(cell: UITableViewCell, indexPath: IndexPath)
    {
        // Alternating row backgrounds colors
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor.uicolorFromHex(Style.darkOrange, alpha:1.0)
        } else {
            cell.backgroundColor = UIColor.orange
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = self.tableView.cellForRow(at: indexPath)
        {
            setCellBackground(cell: cell, indexPath: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        if let cell = self.tableView.cellForRow(at: indexPath)
        {
            setCellBackground(cell: cell, indexPath: indexPath)
        }
    }
    
    // Disable editing of master table
    /*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
     */
    
    // MARK: - Refresh the tableView when orientation changed
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        self.tableView.reloadData()
        performSegue(withIdentifier: "showDetail", sender: self)
    }
}

