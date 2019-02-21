//
//  SignUpModel.swift
//  CoreDataLogin2
//
//  Created by Sukumar Anup Sukumaran on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import UIKit
import CoreData

class SignUpModel: NSObject {
    
    static var shared = SignUpModel()
    var dataController:DataController! = GlobalVars.DATACONTROLLER
   // var users = [User]()
    
//    func fetchRequest(_ main: UIViewController) {
//        // let vc = selfClass as! TravelLocationsMapViewController
//
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//        let sortDescriptor = NSSortDescriptor(key: Constants.Keys.username, ascending: false)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        if let results = try? dataController.viewContext.fetch(fetchRequest) {
//            GlobalVars.USERS = results
//
//        }
//    }
    
    func saveUserDetailsInCore(username: String, password: String) {
        
        let user = User(context: dataController.viewContext)
        user.username = username
        user.password = password
        saved()
    }
    
    
    
    func saved() {
        
        if dataController.viewContext.hasChanges {
            do{
                try dataController.viewContext.save()
                print("Saved User😛")
            }catch let error{
                print(" Error😩 = \(error.localizedDescription)")
            }
        } else {
            print("No Changes in nsmanagedobjectcontext")
        }
        
    }
    
}
