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
    
    // Return data in this format
    // {"numOfAccounts":"4","displayname":"iamsam","accountList":[{"bank_id":"at02-0049--01","bank_fullname":"BANCO SANTANDER, S.A.","bank_shortname":"Santander Bank","id":"iamsam_san","number":"7546486303","amount":"5100.0","currency":"EUR","displayname":"iamsam"},{"bank_id":"at02-1465--01","bank_fullname":"ING BANK, N.V. SUCURSAL EN ESPAÃ‘A","bank_shortname":"Netherlands Bank","id":"iamsam_ing","number":"5800748334","amount":"8800.0","currency":"EUR","displayname":"iamsam"},{"bank_id":"at02-0019--01","bank_fullname":"DEUTSCHE BANK, SOCIEDAD ANONIMA ESPAÃ‘OLA","bank_shortname":"German Bank","id":"iamsam_db","number":"1256812617","amount":"11800.0","currency":"EUR","displayname":"iamsam"},{"bank_id":"at02-0182--01","bank_fullname":"BANCO BILBAO VIZCAYA ARGENTARIA, S.A.","bank_shortname":"Spanish Bank","id":"iamsam_spain","number":"9509745252","amount":"77328.9","currency":"EUR","displayname":"iamsam"}]}
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
