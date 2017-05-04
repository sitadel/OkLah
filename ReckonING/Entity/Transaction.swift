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
    var description: String
    var timeStamp: String
    var myAccount: String
    var toAccount: String
    var amount: String
    var newBalance: String
    
    init?(attributes: [String: Any]) {
        guard
            let description = attributes["description"] as? String,
            let timeStamp = attributes["completedDateTime"] as? String,
            let myAccount = attributes["myAccount"] as? String,
            let toAccount = attributes["toAccount"] as? String,
            let amount = attributes["amount"] as? String,
            let newBalance = attributes["newBalance"] as? String
            else {
                return nil
        }

        self.description = description
        self.timeStamp = timeStamp
        self.myAccount = myAccount
        self.toAccount = toAccount
        self.amount = amount
        self.newBalance = newBalance
    }
}
