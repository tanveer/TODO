//
//  List.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/10/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

struct List: Codable {
    let fruits: [kItem]
    let vegetables: [kItem]
    let dairy: [kItem]
    let meat: [kItem]
    let mics: [kItem]
}

struct kItem: Codable {
    let name: String
}
