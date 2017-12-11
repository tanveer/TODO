//
//  Item.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/10/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import FirebaseDatabase


struct Item {
    var item: String
    var done: Bool = false
    var key: String = ""
    var ref: DatabaseReference?

    init(item: String) {
        self.item = item
        ref = nil
    }

    init(snapshot: DataSnapshot) {
        self.key = snapshot.key
        let values = snapshot.value as! [String: AnyObject]
        self.item = values["item"] as! String
        self.done = values["done"] as! Bool
        self.ref = snapshot.ref
    }

    func toAnyObject() -> Any {
        return [
            "item": item,
            "done": done,
        ]
    }
}
