//
//  Server.swift
//  ReckonING
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation

class Server
{
    static let baseURL = "https://my-reckoning.herokuapp.com/ReckonINGExample/"
    
    static let accountURL = baseURL + "getMyAccounts?"
    static let transactionURL = baseURL + "getTransactionHistoryById?"
    static let createTransaction = baseURL + "createTransaction/"
    
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
    
    //https://my-reckoning.herokuapp.com/ReckonINGExample/createTransaction/iamsam?frombank_id=at02-0182--01&fromid=iamsam_spain&amount=20&tobank_id=at02-1465--01&toid=iamben_ing
    class func createTransaction(me: String, fromBankId: String, fromId: String, amount: NSDecimalNumber, toBankId: String, toId: String) -> URL?
    {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        if let amountStr = formatter.string(from: amount)
        {
            print(amountStr)
            return URL(string: Server.createTransaction +
                me + "?" +
                "frombank_id=" + fromBankId + "&" +
                "fromid=" + fromId + "&" +
                "amount=" + amountStr + "&" +
                "tobank_id=" + toBankId + "&" +
                "toid=" + toId)
        }
        else
        {
            return nil
        }
    }
}
