//
//  SignInModel.swift
//  CoreDataLogin2
//
//  Created by Sukumar Anup Sukumaran on 21/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import CoreData
import UIKit

class SignInModel: NSObject {
    
    var dataController:DataController! = GlobalVars.DATACONTROLLER
    var signUpModel = SignUpModel()
    
    func fetchRequest() {
        // let vc = selfClass as! TravelLocationsMapViewController
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: Constants.Keys.username, ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let results = try? dataController.viewContext.fetch(fetchRequest) {
            GlobalVars.USERS.removeAll()
            GlobalVars.USERS = results
            
        }
    }
    
    
    //MARK:
    func checkUserExistsInCoreData(_ main: UIViewController,username: String, password: String) {
        
        var i = 0
        for user in GlobalVars.USERS {
            i+=1
            print("user\(i) = \(user.username ?? "-NF-") - \(user.password ?? "-NF-")")
            if user.username == username, user.password == password {
                print("Created Session")
                
                UserDefaults.standard.set(true, forKey: Constants.Keys.inSession)
                main.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    //MARK: TO Clear coredata - Never user here
    func clearDataInCore() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        if let results = try? dataController.viewContext.fetch(fetchRequest) {
            print("fetchCompleted")
            let _ = results.map{dataController.viewContext.delete($0)}
            print("clearData")
            signUpModel.saved()
            
        } else {print("failedFetching😩")}
    }
}
