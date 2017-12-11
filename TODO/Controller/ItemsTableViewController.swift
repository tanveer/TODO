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

    private var  items: [[kItem]] = []
    @IBOutlet private weak var tableView: UITableView!
    private var sections: [String] = ["fruits", "vegetables", "dairy", "meat", "mics"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My List".uppercased()
        items  = StaticData.dataSetup()
        self.tableView.reloadData()
    }
}

extension ItemsTableViewController: UITableViewDataSource {

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.textLabel?.text = items[indexPath.section][indexPath.row].name
        return cell
    }
}

extension ItemsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let childId = "\(sections[indexPath.section].uppercased())" + "\(indexPath.row)"
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let item = Item(item: items[indexPath.section][indexPath.row].name)
        ref.child(kUser!.uid).child(childId).setValue(item.toAnyObject())
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].uppercased()
    }
}
