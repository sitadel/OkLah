//
//  DetailedPromoViewController.swift
//  ReckonING
//
//  Created by Ivan Jester Cleofe on 4/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import UIKit

class DetailedPromoViewController: UIViewController {
    
    var promoSite : String = ""
    
    @IBOutlet var webPage : UIWebView!
    @IBOutlet var backButton : UIBarButtonItem!
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPage(promoSite)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPage(_ urlAddress : String)
    {
        let urlPath = URL(string: urlAddress)
        let urlRequest = URLRequest(url: urlPath!)
        self.webPage.loadRequest(urlRequest)
    }
}

