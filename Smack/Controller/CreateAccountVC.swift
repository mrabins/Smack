//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Mark Rabins on 9/5/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text , emailTextField.text != "" else {return }
        guard let password = passwordTextField.text , passwordTextField.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("Logged in user!", AuthService.instance.authToken)
                    }
                })
            }
        }
        
    }
    
    @IBAction func chooseAvatarButtonPressed(_ sender: Any) {
        

    }
    
    @IBAction func generateColorButtonPressed(_ sender: Any) {
        
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    
}
