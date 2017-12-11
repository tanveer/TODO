//
//  ItemsTableViewController.swift
//  TODO
//
//  Created by Tanveer Bashir on 12/10/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ItemsTableViewController: UIViewController {

    private var mainVC: ViewController?
    let ref = Database.database().reference(withPath: "users")
    private var  items: [Item] = []
    
    @IBOutlet private weak var tableView: UITableView!
    private var fruits: [String] = ["🍎", "🍐", "🍊", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ItemsTableViewController: UITableViewDataSource {

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
}

extension ItemsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let item = Item(item: fruits[indexPath.row])
        ref.child(kUser!.uid).child("\(indexPath.row)").setValue(item.toAnyObject())
    }
}
