//
//  Transaction.swift
//  ReckonING
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation

struct Transaction
{
    var description: String
    var timeStampStr: String
    var myAccount: String
    var toAccount: String
    var amount: String
    var newBalance: String
    var balanceCcy: String

    init?(attributes: [String: Any]) {
        guard
            let description = attributes["description"] as? String,
            let timeStamp = attributes["completedDateTime"] as? String,
            let myAccount = attributes["myAccount"] as? String,
            let toAccount = attributes["toAccount"] as? String,
            let amount = attributes["amount"] as? String,
            let newBalance = attributes["newBalance"] as? String,
            let balanceCcy = attributes["balanceCcy"] as? String
            else {
                return nil
        }

        self.description = description
        self.timeStampStr = timeStamp
        self.myAccount = myAccount
        self.toAccount = toAccount
        self.amount = amount
        self.newBalance = newBalance
        self.balanceCcy = balanceCcy
    }
    
    func convertDate(str: String) -> Date?
    {
        // TimeStamp format: 2017-05-03T02:18:39Z
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        // dateFormatter cannot take the original format with a "T"
        // work around by replacing letter T with a space
        return dateFormatter.date(from: str.replacingOccurrences(of: "T", with: " "))
    }
    
    func getTransactionTime() -> String
    {
        if let ts = self.convertDate(str: timeStampStr)
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, h.mm a"
            return dateFormatter.string(from: ts)
        }
        else
        {
            return ""
        }
    }
}
