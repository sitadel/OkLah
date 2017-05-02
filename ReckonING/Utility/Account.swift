//
//  Account.swift
//  ReckonING
//
//  Created by Seet on 2/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation

struct Account
{
    var bankName: String
    var cashAmount: String
    var currency: String
    
    init?(attributes: [String: Any]) {
        guard let name = attributes["bank_fullname"] as? String,
            let amount = attributes["amount"] as? String,
            let curr = attributes["currency"] as? String
            else {
                return nil
        }
        
        bankName = name
        cashAmount = amount
        currency = curr
    }
}
