//
//  ViewController.swift
//  CoreDataLogin2
//
//  Created by Sukumar Anup Sukumaran on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let inSession = UserDefaults.standard.value(forKey: Constants.Keys.inSession) as? Bool ?? false
        print("inSession = \(inSession)")
        
        if !inSession {
            
            viewModel.callingSignInVC(self)
        }
//        if UserDefaults.standard.value(forKey: Constants.Keys.LoginKey) == nil {
//            viewModel.callingSignInVC(self)
//        }
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: Constants.Keys.inSession)
        viewModel.callingSignInVC(self)
    }
    


}

