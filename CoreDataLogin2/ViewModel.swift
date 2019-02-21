//
//  ViewModel.swift
//  CoreDataLogin2
//
//  Created by Sukumar Anup Sukumaran on 20/02/19.
//  Copyright © 2019 TechTonic. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    func callingSignInVC(_ main: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        main.present(vc, animated: false, completion: nil)
    }
}
