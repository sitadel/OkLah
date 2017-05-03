//
//  Cache.swift
//  ReckonING
//
//  Created by Seet on 3/5/17.
//  Copyright © 2017 Hackathon. All rights reserved.
//

import Foundation

class Cache {
    // make Cache a Singleton class
    static let sharedInstance = Cache()
    //let cache = NSCache<AnyObject, AnyObject>()
    let cache = UserDefaults.standard
    fileprivate init() {}
    
    fileprivate let separator = "-"
    
    func clear() {
        //cache.removeAllObjects()
        cache.set(nil, forKey: getAccountsKey())
    }
    
    // MARK: - Cache to support ChoosePlayerViewController
    
    func getAccounts() -> [[String: Any]]?
    {
        /*
        if let cachedVersion = cache.object(forKey: getAccountsKey() as AnyObject) as? [[String: Any]]
        {
            return cachedVersion
        } else {
            return nil
        }
        */
        if let object = cache.value(forKey: getAccountsKey()) as Any?,
            let cachedVersion = object as? [[String: Any]]
        {
            return cachedVersion
        } else {
            return nil
        }
    }
    
    func setAccounts(object:[[String: Any]])
    {
        //cache.setObject(object as AnyObject, forKey: getAccountsKey() as AnyObject)
        cache.set(object, forKey: getAccountsKey())
    }
    
    func getAccountsKey() -> String
    {
        return "accounts"
    }
    
    func clearAccounts()
    {
        clear()
    }
}
