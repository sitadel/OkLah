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
    static let baseURL = "https://myreckoning.herokuapp.com/ReckonINGExample/"
    static let accountURL = baseURL + "getMyAccounts?"
    
    class func getAccounts(username: String) -> URL?
    {
        return URL(string: Server.accountURL + "user_name=" + username)
    }
}
