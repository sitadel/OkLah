//
//  Server.swift
//  ReckonING
//
//  Created by Seet on 3/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation

class Server
{
    static let baseURL = "https://my-reckoning.herokuapp.com/ReckonINGExample/"
    
    static let accountURL = baseURL + "getMyAccounts?"
    static let transactionURL = baseURL + "getTransactionHistoryById?"
    
    class func getAccounts(username: String) -> URL?
    {
        return URL(string: Server.accountURL + "user_name=" + username)
    }
    
    class func getTransactions(username: String, bankId: String, account: String) -> URL?
    {
        return URL(string: Server.transactionURL + "user_name=" + username + "&" +
            "bank_id=" + bankId + "&" +
            "account=" + account)
    }
}
