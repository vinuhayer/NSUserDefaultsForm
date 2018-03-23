//
//  ViewController.swift
//  NSUserDefaultForm
//
//  Created by Appinventiv-Mac on 06/03/18.
//  Copyright © 2018 Appinventiv-Mac. All rights reserved.
//

//UserDefaults- used to Store user information or settings etc. (small size data) in key-value format without a dataBase.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var name: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func  saveData() {
       AppUserDefaults.save(name.text as Any, forKey: AppUserDefaultKeys.nameKey)
       AppUserDefaults.save(mobile.text as Any, forKey: AppUserDefaultKeys.mobileKey)
    }

    func fetchData() {
        if let nameValue = AppUserDefaults.getDataFromUserDefault(AppUserDefaultKeys.nameKey) {
            print(nameValue)
        } else {
            print("nil")
        }
        if let mobilevalue = AppUserDefaults.getDataFromUserDefault(AppUserDefaultKeys.mobileKey) {
            print(mobilevalue)
        } else {
            print("nil")
        }
    }
    
    func deleteData() {
        AppUserDefaults.removeFromUserDefaultForKey(AppUserDefaultKeys.nameKey)
    }
    
    func dropData() {
        AppUserDefaults.clean()
    }
    
    @IBAction func save(_ sender: UIButton) {
        self.saveData()
        print("SAVED")
    }
    
    @IBAction func fetch(_ sender: UIButton) {
        print("FETCHED")
        self.fetchData()
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        self.deleteData()
        print("DELETED")
    }

    @IBAction func dropButtonTapped(_ sender: UIButton) {
        self.dropData()
        print("DROPPED")
    }
}
