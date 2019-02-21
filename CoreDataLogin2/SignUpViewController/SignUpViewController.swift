//
//  SignUpViewController.swift
//  CoreDataLogin2
//
//  Created by Sukumar Anup Sukumaran on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    var funcs = SignUpModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUP(_ sender: Any) {
        
        guard username.text != "", password.text != "",confirmPassword.text != "" else {
            print("one or many is empty")
            return
        }
        
        funcs.saveUserDetailsInCore(username: username.text!, password: password.text!)
       
    }
    
    

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
