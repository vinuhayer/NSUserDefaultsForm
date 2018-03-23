//
//  AppUserDefaults.swift
//  NSUserDefaultForm
//
//  Created by Appinventiv-Mac on 06/03/18.
//  Copyright © 2018 Appinventiv-Mac. All rights reserved.
//

import Foundation

enum AppUserDefaults {}

extension AppUserDefaults
{
    static func save(_ value:Any,forKey key:String) {
        
//MARK: SET DATA
        //set function-- value--The object to store in the defaults database.
        UserDefaults.standard.set(value, forKey:key)
        UserDefaults.standard.synchronize()
    }
    
    static func userDefaultForKey(_ key:String) -> AnyObject? {
        if let value =  UserDefaults.standard.object(forKey: key) {
            return value as AnyObject
        }
        else {
            return nil
        }
    }
    
    static func userdefaultStringForKey(_ key:String) -> String? {
        if let value =  UserDefaults.standard.object(forKey: key) as? String {
            return value
        }
        else {
            return nil
        }
    }
    
    static func getDataFromUserDefault(_ key:String) -> String? {
        
//MARK: GET DATA
        //accessing object of UserDefaults() Return type ->Any?
        if let value = UserDefaults.standard.object(forKey: key) as? String {
            return value
        }
        return nil
    }
    
    static func getAnyDataFromUserDefault(_ key:String) -> AnyObject? {
        if let value = UserDefaults.standard.object(forKey: key) {
            return value as AnyObject
        }
        return nil
    }
    
    static func clean() {
        
//MARK: DROP DATA
        //Removes the contents of the specified persistent domain from the user’s defaults.
        //value (object) in all keys are deleted
        //just like droping structure i.e all rows from database.
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
    
    static func removeFromUserDefaultForKey(_ key:String) {
        
//MARK: DELETE DATA
        //deleting object(value) for a key
        //just like deleting a specific row from database
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
