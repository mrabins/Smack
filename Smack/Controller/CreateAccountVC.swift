//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Mark Rabins on 9/5/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func chooseAvatarButtonPressed(_ sender: Any) {
        

    }
    

    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    
}
