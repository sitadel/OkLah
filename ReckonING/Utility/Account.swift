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
    var bankId: String
    var bankName: String
    var id: String
    var cashAmount: String
    var currency: String
    var displayName: String
    
    init?(attributes: [String: Any]) {
        guard
            let bank = attributes["bank_id"] as? String,
            let name = attributes["bank_fullname"] as? String,
            let i = attributes["id"] as? String,
            let amount = attributes["amount"] as? String,
            let curr = attributes["currency"] as? String,
            let display = attributes["displayname"] as? String
            else {
                return nil
        }
        bankId = bank
        bankName = name
        id = i
        cashAmount = amount
        currency = curr
        displayName = display
    }
}
