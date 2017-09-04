//
//  ChannelVC.swift
//  Smack
//
//  Created by Mark Rabins on 9/3/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60


    }
}
