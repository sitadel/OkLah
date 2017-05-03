//
//  Transaction.swift
//  ReckonING
//
//  Created by Seet on 3/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation

struct Transaction
{
    var myAccount: String
    var toAccount: String
    var amount: String
    var newBalance: String
    
    init?(attributes: [String: Any]) {
        guard let myAccount = attributes["myAccount"] as? String,
            let toAccount = attributes["toAccount"] as? String,
            let amount = attributes["amount"] as? String,
            let newBalance = attributes["newBalance"] as? String
            else {
                return nil
        }

        self.myAccount = myAccount
        self.toAccount = toAccount
        self.amount = amount
        self.newBalance = newBalance
    }
}
