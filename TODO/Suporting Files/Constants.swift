//
//  Constants.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/11/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation
import Firebase


var ref: DatabaseReference {
    return Database.database().reference(withPath: "users")
}

var kUser: User?
