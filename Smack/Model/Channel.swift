//
//  Channel.swift
//  Smack
//
//  Created by Mark Rabins on 10/9/17.
//  Copyright © 2017 self. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
