//
//  AddChannelVC.swift
//  Smack
//
//  Created by Mark Rabins on 10/10/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        channelNameTextField.attributedPlaceholder = NSAttributedString(string: "Channel Name:", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
         descriptionTextField.attributedPlaceholder = NSAttributedString(string: "Description:", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }

    @IBAction func createChannelPressed(_ sender: Any) {
    }
}
