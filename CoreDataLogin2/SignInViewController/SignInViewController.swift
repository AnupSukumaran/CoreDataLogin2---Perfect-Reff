//
//  SignInViewController.swift
//  CoreDataLogin2
//
//  Created by Sukumar Anup Sukumaran on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var signInModel = SignInModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        signInModel.fetchRequest()
    }
    
    
    

    @IBAction func signInBtn(_ sender: Any) {
        guard username.text != "", password.text != "" else {
            print("one or many is empty")
            return
        }
        
        signInModel.fetchRequest()
        signInModel.checkUserExistsInCoreData(self, username: username.text!, password: password.text!)
    }
    
    
    

}
