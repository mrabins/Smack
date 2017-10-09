//
//  ChatVC.swift
//  Smack
//
//  Created by Mark Rabins on 9/3/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var menuButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
}
