//
//  IntentHandler.swift
//  SiriExtension
//
//  Created by Seet on 12/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Intents

// You can test your example integration by saying things to Siri like:
// "Send $20 to Benjamin using <ReckonING>"
// "<ReckonING> Send $20 to Benjamin"

extension IntentHandler: INSendPaymentIntentHandling {
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        // Check that we have valid values for payee and currencyAmount
        guard let payee = intent.payee else {
            print("Incomplete Siri Intent command parameters: missing Payee.")
            return completion(INSendPaymentIntentResponse(code: .unspecified, userActivity: nil))
        }
        guard let amount = intent.currencyAmount else {
            print("Incomplete Siri Intent command parameters: missing Amount.")
            return completion(INSendPaymentIntentResponse(code: .unspecified, userActivity: nil))
        }
        
        // Payee not setup yet.
        if payee.displayName.contains("Ben") || payee.displayName.contains("Nadia") || payee.displayName.contains("Ivan")
        {
            print("proceed.")
        }
        else
        {
            print("Making payment to non-setup account.")
            return completion(INSendPaymentIntentResponse(code: .failureNoBankAccount, userActivity: nil))
        }
        
        // Make your payment!
        if  let amountAsDecimal = amount.amount,
            let url = Server.createTransaction(me:"iamsam", fromBankId: "at02-0182--01", fromId: "iamsam_spain", amount: amountAsDecimal, toBankId: "at02-1465--01", toId: "iamben_ing")
        {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    // Display error message
                    print ("error in Siri Intent makePayment");
                    completion(INSendPaymentIntentResponse(code: .failure, userActivity: nil))
                    
                } else {
                    print ("Siri Intent sent \(amount) to \(payee)");
                    completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
                }
            }
            task.resume()
        }
    }
}

class IntentHandler: INExtension
{
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
}

