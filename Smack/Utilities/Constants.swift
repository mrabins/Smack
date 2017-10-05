//
//  Constants.swift
//  Smack
//
//  Created by Mark Rabins on 9/4/17.
//  Copyright © 2017 self. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: URL Constants
let BASE_URL = "https://smackios.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//MARK: Segues
let TO_LOGIN = "loginSegue"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


// MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// MARK: Headers
let HEADER = [
    "Content-Type": "applcation/json; charset=utf-8"
]
