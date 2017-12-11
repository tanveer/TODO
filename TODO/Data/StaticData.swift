//
//  StaticData.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/11/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import Foundation

class StaticData {

    class func dataSetup() -> [[kItem]] {
        var  items: [[kItem]] = []
        do {
            let decoder = JSONDecoder()
            let path = Bundle.main.path(forResource: "items", ofType: "json") // read static json data
            let url = URL(fileURLWithPath: path!)
            let data = try Data(contentsOf: url)
            let list = try decoder.decode(List.self, from: data)
            items.append(list.fruits)
            items.append(list.vegetables)
            items.append(list.dairy)
            items.append(list.meat)
            items.append(list.mics)
        } catch {
            assertionFailure("While reading items.json: \(error)")
        }
        return items
    }
}
